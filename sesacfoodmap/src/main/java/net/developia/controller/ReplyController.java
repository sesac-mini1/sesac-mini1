package net.developia.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.developia.domain.Criteria;
import net.developia.domain.ReplyVO;
import net.developia.service.ReplyService;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {

   private ReplyService service;

   @PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
      log.info("ReplyVO : " + vo);

      int insertCount = service.register(vo);

      log.info("Reply INSERT COUNT : " + insertCount);

      return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   }


   @GetMapping(value = "/pages/{bno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
   public ResponseEntity<List<ReplyVO>> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {
      log.info("getList.............");

      Criteria cri = new Criteria(page, 10);

      log.info(cri);

      return new ResponseEntity<>(service.getList(cri, bno), HttpStatus.OK);
   }


   @GetMapping(value = "/{cno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
   public ResponseEntity<ReplyVO> get(@PathVariable("cno") Long cno) {
      log.info("get : " + cno);

      return new ResponseEntity<>(service.get(cno), HttpStatus.OK);
   }

   @DeleteMapping(value = "/{cno}", produces = {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> remove(@PathVariable("cno") Long cno, @PathVariable("cno") String password) {
      log.info("remove: " + cno + password);

      return service.remove(cno, password) == 1
            ? new ResponseEntity<>("success", HttpStatus.OK)
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   }


   @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
         value = "/{cno}",
         consumes = "application/json",
         produces = {MediaType.TEXT_PLAIN_VALUE})
   public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("cno") Long cno){
      vo.setCno(cno);

      log.info("cno: " + cno);

      log.info("modify: " + vo);

      return service.modify(vo) == 1
            ? new ResponseEntity<>("success", HttpStatus.OK)
            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   }
}
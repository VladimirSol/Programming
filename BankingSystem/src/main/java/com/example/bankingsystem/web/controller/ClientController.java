package com.example.bankingsystem.web.controller;

import com.example.bankingsystem.domain.clientService.ClientService;
import com.example.bankingsystem.domain.model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClientController {

    @Autowired
    private ClientService clientService;

    private final Client client = new Client();

    @GetMapping("/information")
    public String informationClient(Model model) {
        model.addAttribute("client", clientService.getClientList());
        model.addAttribute("title", "Личный кабинет клиента");
        return "/information";
    }

    @GetMapping("/registration")
    public ModelAndView clientRegistration(ModelAndView modelAndView) {
        modelAndView.addObject("registration", new Client());
        modelAndView.setViewName("/registration");
        return modelAndView;
    }

    @PostMapping("/registration")
    public String clientRegistrationPost(Model model) {
        model.addAttribute(clientService.setClientList(client.getClientId(), client.getBranchId(), client.getRoleId(), client.getSurname(),
                client.getName(), client.getPatronymic(), client.getClientName(), client.getPassword(), client.getSum()));

        return informationClient(model);
    }

    @GetMapping("/removal")
    public ModelAndView clientRemoval(ModelAndView modelAndView) {
        modelAndView.addObject("removal", new Client());
        modelAndView.setViewName("/removal");
        return modelAndView;
    }

    @PostMapping("/removal")
    public String deleteMailPost(Model model) {
        model.addAttribute(clientService.deleteClientList(client.getSurname()));
        return informationClient(model);
    }
}

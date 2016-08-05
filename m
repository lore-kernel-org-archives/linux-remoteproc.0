Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:36808 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753503AbcHEJxR (ORCPT
	<rfc822;linux-remoteproc@vger.kernel.org>);
	Fri, 5 Aug 2016 05:53:17 -0400
Received: by mail-wm0-f52.google.com with SMTP id q128so24731735wma.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Aug 2016 02:53:17 -0700 (PDT)
Date: Fri, 5 Aug 2016 11:53:15 +0200
From: Matteo Sartori <matteo.sartori@t3lab.it>
Subject: rpmsg: exposing the bus to userspace
Message-ID: <20160805095315.GA7702@alexat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org
Cc: Alessio Paccoia <alessio.paccoia@t3lab.it>, Michele Rodolfi <michele.rodolfi@t3lab.it>, Claudio Salati <claudio.salati@t3lab.it>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

I have been working on remoteproc/rpmsg and FreeRTOS/OpenAMP for the
latest three months and recently, with my colleagues, I have started
reasoning about the best possible way to expose the kernel rpmsg bus
to applications running in user space. The idea is to end up with a
clean mechanism for the user-kernel communication, like sockets or
char devices, in order to build AMP applications on top of it.

In fact, we have been running experiments with some out-of-tree
drivers implementing exactly such interfaces, namely a driver
registering a new address family AF_RPMSG for the socket interface,
from Texas Instruments, and a char device driver representing
different rpmsg channels with /dev/rpmsgX special files, found inside
OpenAMP obsolete directory.

I am quite new to kernel development and in particular to remoteproc
subsystem, so I am asking the following questions because maybe I have
missed some past developments and discussions about this topic. I
apologize if this is the case.

- Have you ever considered the inclusion of these out-of-tree modules
  in the mainline?
- If so, have you planned some work on this, or what are the reasons
  for not including these modules?
- Is there already a preferred way for exposing the rpmsg bus for
  generic services to userspace, or is more suitable the idea to have 
  a different rpmsg driver, therefore a user-kernel communication strategy, 
  for each different use case of the bus?

Anyway, I would be very glad to contribute in the direction of an
appropriate user-kernel interface for accessing the rpmsg bus, and at
the moment I have a working test case for the socket driver as well as
for the char driver. Given the fact I don't see the superiority of one
approach compared to the other, I would like to propose and discuss
with you both of them.

This was kind of an introductory email. I am preparing two patchsets.

Best regards,
Matteo

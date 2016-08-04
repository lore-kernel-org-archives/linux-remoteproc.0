Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-yw0-f177.google.com ([209.85.161.177]:34346 "EHLO
	mail-yw0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758566AbcHDKdG (ORCPT
	<rfc822;linux-remoteproc@vger.kernel.org>);
	Thu, 4 Aug 2016 06:33:06 -0400
Received: by mail-yw0-f177.google.com with SMTP id z8so248199503ywa.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Aug 2016 03:33:05 -0700 (PDT)
MIME-Version: 1.0
From: Matteo Sartori <matteo.sartori@t3lab.it>
Date: Thu, 4 Aug 2016 12:33:03 +0200
Message-ID: <CAHvXT5pppxuWmZCrb9xSBWTx0kb3GcHT2YQJM6y8kHNB_QsAkg@mail.gmail.com>
Subject: rpmsg: exposing the bus to userspace
Content-Type: text/plain; charset=UTF-8
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
generic services to userspace, or is the idea to have a different
rpmsg driver, therefore a user-kernel communication strategy, for each
different use case of the bus?

Anyway, I would be very glad to contribute in the direction of an
appropriate user-kernel interface for accessing the rpmsg bus, and at
the moment I have a working test case for the socket driver as well as
for the char driver. Given the fact I don't see the superiority of one
approach compared to the other, I would like to propose and discuss
with you both of them.

This was kind of an introductory email. I am preparing two patchsets.

Best regards,
Matteo

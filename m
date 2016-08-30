Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38593 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754590AbcH3Ohg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Aug 2016 10:37:36 -0400
Received: by mail-wm0-f49.google.com with SMTP id o80so39603992wme.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Aug 2016 07:37:35 -0700 (PDT)
Received: from alexat ([213.209.216.186])
        by smtp.gmail.com with ESMTPSA id lv9sm39847570wjb.22.2016.08.30.07.37.30
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 30 Aug 2016 07:37:30 -0700 (PDT)
Date: Tue, 30 Aug 2016 16:37:27 +0200
From: Matteo Sartori <matteo.sartori@t3lab.it>
Subject: [PATCH 0/1] rpmsg: char device for exposing channels to userspace
Message-ID: <20160830143727.GA25622@alexat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

The canonical method for getting access to the rpmsg bus is to write a specific
driver that manages memory and user-kernel communication as the given
application requires.
This patch instead proposes a simpler and general approach in which the rpmsg
bus, specifically only matched channels, are exposed to userspace through char
devices.

As previously discussed, this approach has the problem of not supporting the 1:N
communication type, where a single program can act like a server that receives
requests from multiple users on a given port. Sockets with bind() and recvfrom()
could better serve this scheme.

However, I propose a chardev strategy that matches quite well with the rpmsg
channel concept. The driver registers itself on the bus with a specific channel
name, "rpmsg-char-dev", and upon matches with discovered devices, allocates and
creates new char devices that reflect newly created rpmsg channels.
Given the fact the rpmsg channel concept belongs to 1:1 communication styles
I would say this is a cheap and simple solution for exporting generic services
to userspace.

The code has been derived from OpemAMP repository
  https://github.com/OpenAMP/open-amp
at the location
  obsolete/system/linux/kernelspace/rpmsg_user_dev_driver/rpmsg_user_dev_driver.c

A counterpoint is that we need an auxiliary buffer to store received rpmsg
messages in. The rpmsg mechanism is asynchronous because a callback get called
upon reception and so we need to copy the message to an intermediary location
in order to free the underlying rpmsg buffer.
An important point to stress is that the actual strategy drops the message if
the kfifo is full.
For the write() case I see a similar problem because there is again a copy from
user to kernel memory prior to sending, a call copy_from_user(), but I believe
this is easier to remove for increasing performances.

Another problem could be about naming: how do I know which is my destination if
there are more than one matched channels? For example, the systems loads two
remotes that both subscribe with the "rpmsg-char-dev" channel and I have to talk
with one of them, specifically. Which is the right target, rpmsg0 or rpmsg1?
I believe such information can be found under sysfs.

The discussion is still going on, but I wanted to illustrate such ideas with a
concrete patch proposal.

Best regards,
Matteo

Matteo Sartori (1):
  rpmsg: driver which exposes channels through char devices

 drivers/rpmsg/Kconfig         |   7 +
 drivers/rpmsg/Makefile        |   1 +
 drivers/rpmsg/rpmsg_chardev.c | 335 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 343 insertions(+)
 create mode 100644 drivers/rpmsg/rpmsg_chardev.c

-- 
2.7.4


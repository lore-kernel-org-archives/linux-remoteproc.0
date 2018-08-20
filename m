Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:45744 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbeHTIzN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Aug 2018 04:55:13 -0400
Received: by mail-qt0-f178.google.com with SMTP id y5-v6so14966762qti.12
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Aug 2018 22:41:00 -0700 (PDT)
MIME-Version: 1.0
Reply-To: dry@embedded-synergy.co.za
From: Denis Ryndine <dry@embedded-synergy.co.za>
Date: Mon, 20 Aug 2018 15:40:59 +1000
Message-ID: <CABViPYkb+g9GkJNVU6AUpzJRwLwZSD9PuxzDrDzgzb6Z0Ky1Gw@mail.gmail.com>
Subject: rproc_elf_load_segments: rproc_elf_load_segments elf loading problem
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello,

The following may look like an error, could someone review.

In rproc_elf_load_segments:

/* grab the kernel address for this device address */
ptr = rproc_da_to_va(rproc, da, memsz);

The last parameter should be filesz. Otherwise this call may fail, as
the case when da is an address within a segment / memory.
(E.g.  placing a RO data after the code within text segment /memory ).

Regards

Denis Ryndine

---
dry@embedded-synergy.co.za | www.embedded-synergy.co.za

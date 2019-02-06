Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-ed1-f46.google.com ([209.85.208.46]:38155 "EHLO
        mail-ed1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfBFWo3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Feb 2019 17:44:29 -0500
Received: by mail-ed1-f46.google.com with SMTP id h50so7403419ede.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Feb 2019 14:44:28 -0800 (PST)
MIME-Version: 1.0
From: Mike <puffy.taco@gmail.com>
Date: Wed, 6 Feb 2019 16:44:15 -0600
Message-ID: <CAB7rCTjfQoFOQkStQFP96+44jjZJSaWxQRk8JuktVGDE19Q7MQ@mail.gmail.com>
Subject: Rpmsg Char Driver
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

First, I think this is the right place for questions relating to
rpmsg, but please redirect me if I'm wrong.

I'm looking to get access to send messages from userspace to the rpmsg
bus, but am not sure the best way.  The base of my work is a 4.9
series kernel for NXP's i.MX7D, but I've been comparing it to mainline
to see if there's anything I could utilize.  In particular, I was
looking at the config option RPMSG_CHAR which states:

"Say Y here to export rpmsg endpoints as device files, usually found
in /dev. They make it possible for user-space programs to send and
receive rpmsg packets."

I compiled a kernel with that option but I don't see any device files
in /dev.  Looking through the code, it seems like only the qcom_smd
driver actually uses this driver, so I assume the Kconfig help text is
somewhat misleading?

Is there a general purpose way to open a channel from userspace?  Or
am I best off using the name service from the remote processor to
announce all the channels I want and write a generic driver that
creates a char device to expose an interface to each?

Thanks,
Mike

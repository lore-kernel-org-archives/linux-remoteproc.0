Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from dd22202.kasserver.com ([85.13.141.248]:40678 "EHLO
        dd22202.kasserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754628AbcIAQXf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Sep 2016 12:23:35 -0400
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com [209.85.220.182])
        by dd22202.kasserver.com (Postfix) with ESMTPSA id 4272AE0009C
        for <linux-remoteproc@vger.kernel.org>; Thu,  1 Sep 2016 18:16:30 +0200 (CEST)
Received: by mail-qk0-f182.google.com with SMTP id t7so90325729qkh.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Sep 2016 09:16:30 -0700 (PDT)
MIME-Version: 1.0
From: Andreas Werner <hs@andy89.org>
Date: Thu, 1 Sep 2016 18:16:28 +0200
Message-ID: <CAB4L-ggBETvyPShvBWsAW91TNAEHyzsDO2xcrgcCuo5nPRfCmw@mail.gmail.com>
Subject: Remoteproc Virtio-Net Support
Content-Type: text/plain; charset=UTF-8
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello Guys,
We want develop a Time Sensitive Networking (TSN) Application on imx6sx.
Base Idea: The Cortex - M4 do all TSN Network Comunikation and provide
multiply virtual TSN Endpoint for the different Time Channels to Linux
Kernel over VirtIO.
I seen the current Mainline Version of Remoteproc dose support only
one Vdev and 2 Vrings.
We need multiply VirtIO Net devices with multiply vrings. Is there
some patches for Remoteproc to support the VirtioNet Dev with multiply
vdevs and vrings?

Best regards
Andy Werner

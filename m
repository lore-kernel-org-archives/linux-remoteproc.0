Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-qt1-f174.google.com ([209.85.160.174]:37498 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbeIYK3Z (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 25 Sep 2018 06:29:25 -0400
Received: by mail-qt1-f174.google.com with SMTP id n6-v6so11986586qtl.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Sep 2018 21:23:49 -0700 (PDT)
MIME-Version: 1.0
Reply-To: dry@embedded-synergy.co.za
From: Denis Ryndine <dry@embedded-synergy.co.za>
Date: Tue, 25 Sep 2018 14:23:40 +1000
Message-ID: <CABViPY=msr16UGzRFQRcLLD6tZ77A-jsGbkn9HEnqA6zvGbuTQ@mail.gmail.com>
Subject: review: imx_rproc stop, start steps
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello,

Please review stop, start steps on imx_rproc, with respect to  iMX7D.

The start method will set M4P bit - platform reset - which resets M4
platform (ref DRM for platform) and does not guarantee M4 memory
preserving. That includes caches and TCM.

I cannot point out where in DRM it mentions TCM will be invalidated,
but I had support case with NXP on this and reply explicitly was TCM
is not guaranteed to preserve their content after CM4 platform reset.

Thus,  stop, load firmware to TCM, start, as defined currently, not
guaranteed to work.

I suggest to change stop and start routines for iMX7D as:

1. In stop : Set M4C_NON_SCLR_RST bit (as is currently done), which
sets bits 0 and 1 in the M4 reset control register IMX7D_SRC_SCR
(the reset bits part of the register is now as after POR ). Core is
held in reset.

2.  In stop : issue platform reset - set IMX7D_SW_M4P_RST - keeping
the other bits as is, and wait will platform reset to complete.  The
M4 platform reset does not clear bits 0, 1 (core reset bits).

3. In start:  clear IMX7D_SW_M4C_NON_SCLR_RST / bit 0, to reset the
core and start execution.

Unless the stop method is ever meant to be used just for
stopping/resetting core only ( is there such use ?), this is then the
more correct way to stop, start, and possibly load new firmware
in-between.

Even if TCM contents loss isn't an actual problem, the above steps are
closer to the procedure as outlined in Detailed Procedure in AN5317
application note.

Regards,

Denis Ryndine

---
dry@embedded-synergy.co.za | www.embedded-synergy.co.za

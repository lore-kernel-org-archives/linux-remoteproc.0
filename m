Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7A0C4727D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 00:10:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13CF523A6C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 00:10:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VksqWvA/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbgIVAKC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 20:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727407AbgIVAKC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 20:10:02 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FC7C0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:02 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b124so10758474pfg.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pplI8lBFdqylD+9AB3kyxEb1yGakx0V/9od+sbt5zHA=;
        b=VksqWvA/jtwTVb3pd4p2bpDzqb5GG5Cqe1SKMbq1w3xn22KN/e4wonpFslbspRSxKX
         G/BS/H0xhhE2HScngb6aDAAQLR+9hmVJ/2ncacKOFXNKvM/Yf4tlYKgJsmGL0Y6IJSej
         UOlSn9PqA7k4rQSwp1UhkI9VrGl8ezyMnqehv3B2ZHGGdKN2yDNGwXaS9SxFUte6PBMy
         J3Uua4vTQzz/JWhlUcP8+2EqNMquj6eh+rPCCfkCdlWdB0FGj5jGFcEjPGQhf6HGtsK7
         Vq8qlOWo9qbc5p28kkt1c92eu8qj04wGoRO2OmA1ENxEmILcBVlRqfdQ3JqeTuiBRit3
         uhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pplI8lBFdqylD+9AB3kyxEb1yGakx0V/9od+sbt5zHA=;
        b=TwMk0HT/MpvoSZ7P5nOFvKzabWpNbTE72zpLntbukFGvSqDG2FSqFtTojMCNPU7VO/
         GE+IHVtOAEHk63r7aMBumRW6mPVsNoUFNOKIzwbyix3goX/0SH1T1EjFkemZYjvmMLYe
         pX9j68DNVZuwV++V9CWZ7mM+I7mPaixhf08FOkNuNFnEnq7AQBfWidCZHB8Y9xoCx7la
         hsRWCFhS0TAKXRKXnomd2YpQmJyN/TpFltbp+zNr4/UTDQqeW4ERzfW/oNvo6VcEdLSb
         U85oHxsU4M+WzmgSZZuZI+3z+9GnX0X59UGmjdgiNuqkQB56O+rdX1PpXcKoY9yF0XPU
         c9NQ==
X-Gm-Message-State: AOAM5309+WHtVvKSWwyVeMqFQXnp7xFDPiEH/kUytCXXZocotm8K0Esg
        9I+y1olACCsbLfYHjXG91XNLbw==
X-Google-Smtp-Source: ABdhPJw5x3351y0RIzkxGyGNg4O6s7LFFkcabpH6zjb4HSBoqXG4rJMLX3u3+qi8aAVG5gWfb3n5Qw==
X-Received: by 2002:a63:29c8:: with SMTP id p191mr1509418pgp.45.1600733401833;
        Mon, 21 Sep 2020 17:10:01 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c9sm12807953pfn.78.2020.09.21.17.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 17:10:01 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        guennadi.liakhovetski@linux.intel.com
Cc:     loic.pallardy@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] rpmsg: Make RPMSG name service modular 
Date:   Mon, 21 Sep 2020 18:09:50 -0600
Message-Id: <20200922001000.899956-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi all,

After looking at Guennadi[1] and Arnaud's patchsets[2] it became
clear that we need to go back to a generic rpmsg_ns_msg structure
if we wanted to make progress.  To do that some of the work from
Arnaud had to be modified in a way that common name service
functionality was transport agnostic.

This patchset is based on Arnaud's work but also include a patch
from Guennadi and some input from me.  It should serve as a
foundation for the next revision of [1].

Applies on rpmsg-next (4e3dda0bc603) and tested on stm32mp157. I
did not test the modularisation.   

Comments and feedback would be greatly appreciated.

Thanks,
Mathieu 

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=346593
[2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=338335

Arnaud Pouliquen (5):
  rpmsg: virtio: rename rpmsg_create_channel
  rpmsg: core: Add channel creation internal API
  rpmsg: virtio: Add rpmsg channel device ops
  rpmsg: Turn name service into a stand alone driver
  rpmsg: virtio: use rpmsg ns device for the ns announcement

Guennadi Liakhovetski (1):
  rpmsg: Move common structures and defines to headers

Mathieu Poirier (4):
  rpmsg: virtio: Move virtio RPMSG structures to private header
  rpmsg: core: Add RPMSG byte conversion operations
  rpmsg: virtio: Make endianness conversion virtIO specific
  rpmsg: ns: Make Name service module transport agnostic

 drivers/rpmsg/Kconfig            |   9 +
 drivers/rpmsg/Makefile           |   1 +
 drivers/rpmsg/rpmsg_core.c       |  96 +++++++++++
 drivers/rpmsg/rpmsg_internal.h   | 102 +++++++++++
 drivers/rpmsg/rpmsg_ns.c         | 108 ++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c | 284 +++++++++----------------------
 include/linux/rpmsg_ns.h         |  83 +++++++++
 include/uapi/linux/rpmsg.h       |   3 +
 8 files changed, 487 insertions(+), 199 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_ns.c
 create mode 100644 include/linux/rpmsg_ns.h

-- 
2.25.1


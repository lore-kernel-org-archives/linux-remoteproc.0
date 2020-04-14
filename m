Return-Path: <SRS0=6AeO=56=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E659DC2BB1D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Apr 2020 22:58:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C06562074D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Apr 2020 22:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MqZrnHNZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634322AbgDNW63 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Apr 2020 18:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730783AbgDNW61 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Apr 2020 18:58:27 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E36C061A0E
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 15:58:27 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k15so652629pfh.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 15:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EF11WfQVnD9UTOZQHwLCz7V4fPkuL/l2xmqk1xxRd88=;
        b=MqZrnHNZ7XofH+r983WLDOJb7uvqqwBHnwLjioaZAViwpvOMBOOh3c1mvmzN4tg5Ao
         0MSZjzPNc53ywbOHV4rpEpGt/dVAwarzcMCW1P4ziNkDNAVl8FTrgU8adOTXA7F8xxSK
         e44q4agun5bEPcUgwk01nbBPH4Hs3cNqTr7ZUTranDNkOMKBCqX6pkks95GrsPEWTkmp
         Z/vRdRFfDfwp67oevd8oouTuL0AKu6+qscORta066PANcNTjqLi5RmZyf+dUbA48847j
         TCrsM5mE8GqdkA2+1bf7ePi8p+Vu+95k74Fvw6qlUO3In8j30isooIeaLzH37Y7UOAHn
         v13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EF11WfQVnD9UTOZQHwLCz7V4fPkuL/l2xmqk1xxRd88=;
        b=bd3mTh12c/rtWGxaOCZSjKukj1rhbG4bQyXPMddKSsUxEQG1czdgD7Wg0RlNlTVVdw
         bKoMk+s6M7zhFCvDfbKqjf9zSdx3Pd1atG8eQlffqPUC8n+q2B5UxPGXHakbZ6UwAM85
         nqkLiAwXgEC/7BnsPV7RVWcp4nCCkjZUVcjfv9O16KfP5J9xo2DikVeRafoNIGAwxHpa
         LgJpTVm+UW6f1oLDuM8YUZmrxHj3pJatUziQV20AzLU8+LpBYgPkZDiGCyey90KOncyq
         gaOd0UWa+s2xIsZH7bADsACgCxDslMhcAhESDBPjOE4q1HQ18gefu/Js2XdERSOpuBQF
         WkoA==
X-Gm-Message-State: AGi0PuYaxPZTTXg+l3DsJKnmtMIlNNdtdxAFEnRvkD8yHfeiqzomtD9q
        n/HwSA+EU/3UUe5ruPXVEmli/A==
X-Google-Smtp-Source: APiQypI6ohmT7OqQbKuTQ4od+84Rmx0PrnmhQsFTwpM7mPJJvW2AxQJj3rO69QWEz9/bt/2Vmic6CQ==
X-Received: by 2002:aa7:95ae:: with SMTP id a14mr23692405pfk.164.1586905106770;
        Tue, 14 Apr 2020 15:58:26 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i190sm10122359pfc.119.2020.04.14.15.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 15:58:26 -0700 (PDT)
Date:   Tue, 14 Apr 2020 15:58:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wang Wenhu <wenhu.wang@vivo.com>
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org, kernel@vivo.com, agross@kernel.org,
        ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3,0/3] drivers: rpmon: new driver Remote Processor
 Monitor
Message-ID: <20200414225823.GH892431@yoga>
References: <20200412112405.24116-1-wenhu.wang@vivo.com>
 <20200414035949.107225-1-wenhu.wang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414035949.107225-1-wenhu.wang@vivo.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200414225823.g3L2tkaJCwq63jLvsWK9srvZtDar5QmbmkpX5lpquOM@z>

On Mon 13 Apr 20:59 PDT 2020, Wang Wenhu wrote:

> RPMON is a driver framework. It supports remote processor monitor
> from user level. The basic components are a character device
> with sysfs interfaces for user space communication and different
> kinds of message drivers introduced modularly, which are used to
> communicate with remote processors.
> 
> As for user space, one can get notifications of different events
> of remote processors, like their registrations, through standard
> file read operation of the file descriptors related to the exported
> character devices. Actions can also be taken into account via
> standard write operations to the devices. Besides, the sysfs class
> attributes could be accessed conveniently.
> 
> Message drivers act as engines to communicate with remote processors.
> Currently RPMON_QMI is available which uses QMI infrastructures
> on Qualcomm SoC Platforms.
> 
> RPMON_QMI implements a kind of communication routine for RPMON to
> communicate with remote processors through QMI infrastructure.
> RPMON_QMI itself is designed as a modular framework that would
> introduce different kind of message sets which are binding to
> different services.
> 
> RPMON_QMI creates a device of rpmon_device type for each remote
> processor endpoint. All the endpoint devices share an unique set
> of QMI suite.
> 
> RPMON_QMI_MSG_V01 implements a RPMON_QMI message set for connection check.
> RPMON_QMI defines its message types modularly. Each rpmon service
> binds to a message set and introduced as a module. This version 1.0
> message set could be used for connection checking of remote processors.
> 
> RPMON_QMI messages depend on QCOM_QMI_HELPERS and should be updated
> together with QMI related modules.
> 

Hi Wang,

What additional transports do you expect for this to be a framework and
not just a driver? Why not implement the rpmon client directly in
userspace?

Regards,
Bjorn

> Changes since v1:
>  - Addressed review comments from Randy
> Changes since v2:
>  - Added Cc list
>  - Commit log typo fixing
>  - Use the ARRAY_SIZE instead of calculations of multiple sizeof()
>  - Use micros for qmi message tly_type fields
> 
> Wang Wenhu (3):
>   driver: rpmon: new driver Remote Processor Monitor
>   driver: rpmon: qmi message version 01
>   driver: rpmon: add rpmon_qmi driver
> 
>  drivers/Kconfig                  |   2 +
>  drivers/Makefile                 |   1 +
>  drivers/rpmon/Kconfig            |  54 ++++
>  drivers/rpmon/Makefile           |   3 +
>  drivers/rpmon/rpmon.c            | 506 +++++++++++++++++++++++++++++++
>  drivers/rpmon/rpmon_qmi.c        | 431 ++++++++++++++++++++++++++
>  drivers/rpmon/rpmon_qmi.h        |  76 +++++
>  drivers/rpmon/rpmon_qmi_msg_v1.c | 258 ++++++++++++++++
>  include/linux/rpmon.h            |  68 +++++
>  9 files changed, 1399 insertions(+)
>  create mode 100644 drivers/rpmon/Kconfig
>  create mode 100644 drivers/rpmon/Makefile
>  create mode 100644 drivers/rpmon/rpmon.c
>  create mode 100644 drivers/rpmon/rpmon_qmi.c
>  create mode 100644 drivers/rpmon/rpmon_qmi.h
>  create mode 100644 drivers/rpmon/rpmon_qmi_msg_v1.c
>  create mode 100644 include/linux/rpmon.h
> 
> -- 
> 2.17.1
> 

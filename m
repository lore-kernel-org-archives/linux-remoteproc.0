Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F3AC4332D
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Jan 2021 23:11:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1303A229C5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Jan 2021 23:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbhADXLH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Jan 2021 18:11:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbhADXLH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Jan 2021 18:11:07 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B51DC061793
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Jan 2021 15:10:27 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id y128so27510027ybf.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Jan 2021 15:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PQqz8iYh4JjR1R024ILlEO8eb3o6zDUF7NbI3cgZ5No=;
        b=AAiSUFOgYQGBzGI2oru3BuvBQGFyXAW+J/5WeKu3/Im4RYrq6YBywGpqK8ZoGzhuk7
         k6AWmL9NdCiLu/0cUJ0OTGdSuS65wF9maB8Ac2u4HBt0bdRcxm1PiXiUQ3L5U9ess6bq
         BtdrVM1YkjGKd/ppINOHQntTYHZsk21O2vYMg2ugWHlSZ5zO+WcjPf1GRHAYgVcFKh83
         1aA4lixO/jA5gBNReHsChXY5o+1fLl3iB1PE0VK6BuOcd3ljJ+mRiNUhCPdPQcSMNSmF
         P3f7uCC/nOp6mk+18DNwnUVTndgLcnO47t2gTnjc8RftTmKKHPqEduKvRJhqIrN3ktGl
         ykog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PQqz8iYh4JjR1R024ILlEO8eb3o6zDUF7NbI3cgZ5No=;
        b=SGNE6iqb/SoP4uwvHt8D5xlCpMZOnnQ4bwimsSqn+zBAwf77UPmZuuSmAyuBJ2giOa
         DQ/jVG7WmZLjVreYavP8BEsuuVwziVNcXtuHDYrUeK+WWntD/zyGAmZWedn+b0S4slZe
         B18jQD0dTW8IavNXVhkpesMyBqFBVgNP/KCRpUKAU5Rx0fvJVmXCu0qdGBi/KL7FdfFK
         gKFiIZ1N9BV0v9OmpolzVrt/fDNUJpV/U60rjySHfnkE7RAltzbc5H+x4op4bGRewzAD
         d7vkAPNedP/82XWtS0DPDB0q5Ra6XJuOLGkiOk8OWWERMpGYmCA0uVWvs4u1Us2Gc1fo
         GNAQ==
X-Gm-Message-State: AOAM532ew/yyghsrd6fjaFRdxhxF4yL9TJUeM4UImb4sBhbBenYOTqeA
        HDL11dfC3tI82Er9aajnZd34v/nJuEAdlg==
X-Google-Smtp-Source: ABdhPJw0jWCPgRx8zQF4M6NIie7Lh8JkBAQxRpc6r2RC+I9EUA2tZK8oqyXXTb+/6PiPPvzexUSEIg==
X-Received: by 2002:a9d:4b17:: with SMTP id q23mr53766028otf.157.1609801401370;
        Mon, 04 Jan 2021 15:03:21 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r15sm13529779oie.33.2021.01.04.15.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 15:03:20 -0800 (PST)
Date:   Mon, 4 Jan 2021 17:03:19 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 00/16] introduce generic IOCTL interface for RPMsg
 channels management
Message-ID: <X/Oet4lT9Hf14adx@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:

> This series is a restructuring of the RPMsg char driver, to create a generic
> RPMsg ioctl interface for all rpmsg services.
> 
> The RPMsg char driver provides interfaces that:
> - expose a char RPMsg device for communication with the remote processor,
> - expose controls interface for applications to create and release endpoints.
> 
> The objective of this series is to decorrelate the two interfaces:
>   - Provide a char device for a RPMsg raw service in the rpmsg_char that can be
>     probed by a RPMsg bus on a ns announcement.
>   - Generalize the use of the ioctl for all RPMsg services by creating the
>     rpmsg_ctrl, but keep it compatibile with the legacy.
> 
> If the V1 create a new rpmsg_raw driver in addition to the rpmsg_ctrl this
> version try to reuse the rpmsg_char driver by addapting QCOM GLINK and SMD
> drivers.
> So a goal of this version is to help to determine the best strategy to move
> forward:
>   - reuse rpmsg_char.
>   - introduce a new driver and keep rpmsg_char as a legacy driver for a while.
> 
> Notice that SMD and GLINK patches have to be tested, only build has been tested.
> 
> 1) RPMsg control driver: rpmsg_ctrl.c
>   This driver is based on the control part of the RPMsg_char driver. 
>   On probe a /dev/rpmsg_ctrl<X> interface is created to allow to manage the
>   channels.
>   The principles are the following:
>   - The RPMsg service driver registers it's name and the associated service
>     using the rpmsg_ctrl_unregister_ctl API. The list of supported services
>     is defined in  include/uapi/linux/rpmsg.h and exposed to the
>     application thanks to a new field in rpmsg_endpoint_info struct.
>   - On the RPMsg bus probe(e.g virtio bus) an rpmsg_ctrl device is
>     registered that creates the control interface.
>   - The application can then create or release a channel by specifying:
>        - the name service
>        - the source address.
>        - the destination address.

Why is this useful?

>   - The rpmsg_ctrl uses the same interface than the ns announcement to
>     create and release the associated channel but using the driver_override
>     field to force the service name.
>     The  "driver_override" allows to force the name service associated to
>     an RPMsg driver, bypassing the rpmsg_device_id based match check.

You mean, the chinfo driver_override allows the ioctl to specify which
driver should be bound to the device created for the newly registered
endpoint?

>   - At least for virtio bus, an associated ns announcement is sent to the
>     remote side.  
> 
> 2) rpmsg char driver: rpmsg_char.c
>     - The rpmsg class has not been removed. The associated attributes
>       are already available in /sys/bus/rpmsg/.

So today a rpmsg_device gets the same attributes both from the class and
the bus? So the only difference is that there will no longer be a
/sys/class/rpmsg ?

Regards,
Bjorn

>     - The eptdev device is now an RPMsg device probed by a RPMsg bus driver
>       (probed only by the ioctl in rpmsg_char driver).
> 
> Know current Limitations:
> - Tested only with virtio RPMsg bus and for one vdev instance.
> - The glink and smd drivers adaptations have not been tested (not able to test).
> - To limit commit and not update the IOCT interface some features have been not
>   implemented in this first step:
>     - the NS announcement as not been updated, it is not possible to create an
>       endpoint with a destibnation address set to RPMSG_ADDR_ANY (-1),
>     - not possible to destroy the channel,
>     - only the "rpmsg-raw" service is supported.
> 
> This series can be applied in Bjorn's rpmsg-next branch on top of the
> RPMsg_ns series(4c0943255805).
> 
> This series can be tested using rpmsgexport tools available here:
> https://github.com/andersson/rpmsgexport.
> ---
> new from V1[1]:
> - In V1 the rpmsg_char.c was not impacted, a rpmsg_raw.c has been created
>   instead.
> - IOCTL interface as not been updated (to go by steps).
> - smd and glink drivers has been updated to support channels creation and
>   release.
> 
> [1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=327277
> 
> Arnaud Pouliquen (16):
>   rpmsg: introduce RPMsg control driver for channel creation
>   rpmsg: add RPMsg control API to register service
>   rpmsg: add override field in channel info
>   rpmsg: ctrl: implement the ioctl function to create device
>   rpmsg: ns: initialize channel info override field
>   rpmsg: add helper to register the rpmsg ctrl device
>   rpmsg: char: clean up rpmsg class
>   rpmsg: char: make char rpmsg a rpmsg device without the control part
>   rpmsg: char: register RPMsg raw service to the ioctl interface.
>   rpmsg: char: allow only one endpoint per device
>   rpmsg: char: check destination address is not null
>   rpmsg: virtio: use the driver_override in channel creation ops
>   rpmsg: virtio: probe the rpmsg_ctl device
>   rpmsg: glink: add create and release rpmsg channel ops
>   rpmsg: smd: add create and release rpmsg channel ops
>   rpmsg: replace rpmsg_chrdev_register_device use
> 
>  drivers/rpmsg/Kconfig             |   8 +
>  drivers/rpmsg/Makefile            |   1 +
>  drivers/rpmsg/qcom_glink_native.c |  96 +++++++--
>  drivers/rpmsg/qcom_smd.c          |  59 +++++-
>  drivers/rpmsg/rpmsg_char.c        | 246 ++++++-----------------
>  drivers/rpmsg/rpmsg_ctrl.c        | 320 ++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |  14 --
>  drivers/rpmsg/rpmsg_ns.c          |   1 +
>  drivers/rpmsg/virtio_rpmsg_bus.c  |  38 +++-
>  include/linux/rpmsg.h             |  40 ++++
>  include/uapi/linux/rpmsg.h        |  14 ++
>  11 files changed, 606 insertions(+), 231 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
> -- 
> 2.17.1
> 

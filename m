Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E59C4332F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 20 Oct 2022 15:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbiJTPso (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 20 Oct 2022 11:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbiJTPsn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 20 Oct 2022 11:48:43 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7297E1C2E8C
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Oct 2022 08:48:42 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id s196so18294704pgs.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Oct 2022 08:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LXfzy0Dhjuy0dZN0SLd5jezzdUKd7SK2UJTKt+fpjc=;
        b=FJE2ipZr6Y73vsXCpZFToReaXqO4Q5OV+E5n9UaaNkzuHj9tzDEpU9nvTUsnT75NGC
         5jttBF213RUHcQP/SEo7J61EBFrt7ud72zFZJblYTZRzLUfAcoElv/Bpopcfod/WQf4i
         JrkEGDzRP12XzzjX2WUsYK8jFsL9tuB1IM4HuMKABHeVmte0Fk6H/g3WGvZpNBIHldJJ
         2RPf2bTeFoYliJNYNIuuuPb6B1z7f8/+CkvxfwlQnAz6t6KX/Q7DBhWix23AQCHE5fq4
         ZBRshhc5r7COzP9KcoRTewkEoBiQpMAEUcrbjQ6cRl+x46c7n5kFOuO4bvVdUBgpGqsX
         N2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LXfzy0Dhjuy0dZN0SLd5jezzdUKd7SK2UJTKt+fpjc=;
        b=hRKhpjB6bTIXKOhKHS0jMk3Q/2qrM9wKCaTlq62kWXr4UO/FXRIthXB2vnDYDTW3LP
         khq7bs/9VZg2EzlTJwfkAhVluvX3jJb6TvH/QSFkALRX0/UrtPXhw8aIZXakn2cRElWG
         I3Hh/oyJmAcd1MxMUJNX85A8buh9mTpE92Gctl4DQC+wiKsi3bcbqMkCIQQi3lakXpYy
         WQ3IIu1qyfXihD3LGO5TlCZCuApRZFJ2LU56ptuoYs82HsoN0dCwhJRHuC28zPaT9Xe+
         Hd7xWnAQk0N4JpKGtR5qGPMWFElMihHs0k7OXdxkilHI7gM/Mx8E94B8nKiSA/tlXkjX
         GC0A==
X-Gm-Message-State: ACrzQf0HeT0wvx5NoFUF5ggLHKHDPdxNE+9W9dEOWQy/1CW9WZCWsXe7
        1qt2WIGmWu8vDfxx/2GJEkj0KQ==
X-Google-Smtp-Source: AMsMyM4VrtlmHh5+KxVFZWEHmMeUpKiiWf+uF8KIhNNzbuVwSWaGfoI89ClMGHAczlUeKTFnBAcsbQ==
X-Received: by 2002:a05:6a00:24c2:b0:52e:7181:a8a0 with SMTP id d2-20020a056a0024c200b0052e7181a8a0mr14731632pfv.57.1666280921717;
        Thu, 20 Oct 2022 08:48:41 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b17-20020aa78ed1000000b0054097cb2da6sm13454962pfr.38.2022.10.20.08.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 08:48:40 -0700 (PDT)
Date:   Thu, 20 Oct 2022 09:48:39 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Subject: Re: [INFO] Remoteproc/RPMSG patchset review order for October 19th
 2022
Message-ID: <20221020154839.GA330801@p14s>
References: <CANLsYkzjTnXxqqFxZp2ya7tRj0JWyifHHJvprTLysQWU-V1ksw@mail.gmail.com>
 <DU0PR04MB941792CF75BBE8A0C6E1D3D0882A9@DU0PR04MB9417.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB941792CF75BBE8A0C6E1D3D0882A9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Oct 20, 2022 at 03:59:33AM +0000, Peng Fan wrote:
> Hi Mathieu,
> 
> > Subject: [INFO] Remoteproc/RPMSG patchset review order for October 19th
> > 2022
> 
> I not see i.MX8QM/QXP in your queue.

I am done reviewing this revision.

> Do you need me send V8 for the i.MX8QM/QXP support with only addressing
> the comment in patch 2/7?
> https://lore.kernel.org/all/20221014031037.1070424-1-peng.fan@oss.nxp.com/
> Or I wait your comments on patch 6/7 and 7/7, then send V8?
>

I have clearly indicated the improvement I want so see in 6/7.

> Thanks,
> Peng.
> > 
> > [PATCH v5 0/3] Add support for WASP SoC on AVM router boards [PATCH v3
> > 00/11] Add support for MT8195 SCP 2nd core [PATCH v10 0/6] Add Xilinx
> > RPU subsystem support [PATCH v6 0/6] Introduce PRU remoteproc
> > consumer API [PATCH V3 0/3] rpmsg signaling/flowcontrol patches

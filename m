Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C03BC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Nov 2021 07:27:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40DF061058
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Nov 2021 07:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhKAHaE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Nov 2021 03:30:04 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:41608 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbhKAHaC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Nov 2021 03:30:02 -0400
Received: by mail-ed1-f47.google.com with SMTP id h7so61935224ede.8;
        Mon, 01 Nov 2021 00:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QX73/TVtR5W8m/Vq63b5sJhbliBL72ushPOHfy32+cA=;
        b=KM4JJfDijYvvnT3SEC2XN73FuVc1kdbqJ+pW/VkmK7MkP+QvJY0229gHw1RyEv1nOl
         7gnOaY83bDfwrYvJXulTfyGwigUT4/CgiBSdRXn5xKAlo3jjqTqqkPKSUPRTQwrNLXxc
         KpWKofXV9c6kaPrvFYRMG+08AhUNaUaJdVZ1P19kZvZOjfsL+Vv1f4mU8GqXgA2QOafA
         ACFs740O8y2wdJ60BT3bSDCiMBOfbPhMvxg59XG1NhpG89lsnCm/N+UNyECdtwggLAw1
         ORHK7S+/PFb6HGI5hg6hMs5S3uAeTo4s+N5MvRwRcxXAe2qxSd33RnfXfmxYaP6dIiSb
         zewQ==
X-Gm-Message-State: AOAM53138G8dZXhUrKGDrdzJkGi/94AlC5xcn+TFUuB2s074Hr0fojoq
        Ppih9/NKjA3orO2q9xgpGpE=
X-Google-Smtp-Source: ABdhPJz67dOV3GnCoSUWOvabzexqGXdP8guxumkAaVgH9YZqCSQCmsiydaI/dW9/wtOJPyA45DiFiw==
X-Received: by 2002:a17:906:4e54:: with SMTP id g20mr31002753ejw.284.1635751648035;
        Mon, 01 Nov 2021 00:27:28 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id w1sm1854315edd.49.2021.11.01.00.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 00:27:27 -0700 (PDT)
Message-ID: <0b42eede-d909-1afb-f3fc-c4ee1e2fc0f4@kernel.org>
Date:   Mon, 1 Nov 2021 08:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v10 0/2] Add rpmsg tty driver
Content-Language: en-US
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suman Anna <s-anna@ti.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20211015094701.5732-1-arnaud.pouliquen@foss.st.com>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20211015094701.5732-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 15. 10. 21, 11:46, Arnaud Pouliquen wrote:
...
>   drivers/rpmsg/rpmsg_core.c       |  21 +++
>   drivers/rpmsg/rpmsg_internal.h   |   2 +
>   drivers/rpmsg/virtio_rpmsg_bus.c |  10 ++
>   drivers/tty/Kconfig              |  12 ++
>   drivers/tty/Makefile             |   1 +
>   drivers/tty/rpmsg_tty.c          | 274 +++++++++++++++++++++++++++++++
>   include/linux/rpmsg.h            |  10 ++

Hi,

care to add an entry to MAINTAINERS too?

thanks,
-- 
js
suse labs

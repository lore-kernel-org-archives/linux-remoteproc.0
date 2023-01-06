Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE9AC5479D
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Jan 2023 16:34:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbjAFQe0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 6 Jan 2023 11:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbjAFQeZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 Jan 2023 11:34:25 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBF276EFA
        for <linux-remoteproc@vger.kernel.org>; Fri,  6 Jan 2023 08:34:24 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id r18so1467512pgr.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Jan 2023 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GLC5QUeUL2afI6fkE2hQgTHlKSoxUZrTGJ/pG2j0kWA=;
        b=w3VSh96pSDfPKxhIYAAO/vefawk9pjXMQGzqCj1VBVod2nSAHd1botoFl8A65MufYq
         6SKlVedRvbrkaU1TSRV26Ku27uPwGEW5R5z6vGEVyIp2IaUiprGgLpteQgkZbXTUoukO
         Oh6UfkIoTM7Pgaui3yR2ulrqvpaU50RoCVDkoXfJCpK1V5Yd8XhoFz2r2Z0DwM709xRz
         7CuezLqYehdDIu33yTk1OGc7dOaVYJ7UOUjT6+/mJ4VfSRdgCU0u/4x3eSL30r4+p346
         v6u+/LgwGvJbWk5C1xUB/5nB98H7F4ycfdPFQNdgNdX4lptWf7czUZ8HtUDohCh+gBKZ
         2GmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLC5QUeUL2afI6fkE2hQgTHlKSoxUZrTGJ/pG2j0kWA=;
        b=wxqRXoXxYy/lkKSnsXcBR99xEvKHZs/RX7dHKWsI4H25XoiQM4hwrxj+Qv+UROqoel
         sX9hz3K/0GCpOM5VZNMfbC4aNYXWD0cw32c1qey9VBtgBeWItBOp3oaf/8IjQ+dftyeR
         JWw7OMQ86ITP9AaEGXeqkJjz4MWqsu1UcBw79NwYUtv72wq9wnYJs+DAN2j69IylirpN
         6z6wenMCPxvFGPHNstpa02P64eSca9HJiaOz0wbnn4vMmdgj+DxzKkmujn398L9oky3c
         mqvC315/ESeitrOA0c4BUiL2xx9+s4KQRNK/goanPcO296Sv2i1lgy9KrQnmaVi0Fg9p
         Mdcg==
X-Gm-Message-State: AFqh2kpG2eIDwJWMZWvzIEjLgA7XLn093qBT51QrpczMz77G+/YWHBDh
        nL7ridDB+c9I3Uy1umL/QoAvtQ==
X-Google-Smtp-Source: AMrXdXupbQ23NlCXQq5N5/pRiwBTmYJq6n3/vRFF0HtTT9Bx4yoTaJfrihJF+V5rhcHAnyIj6AYxag==
X-Received: by 2002:a62:1c42:0:b0:582:7d77:7fa2 with SMTP id c63-20020a621c42000000b005827d777fa2mr18705684pfc.11.1673022864134;
        Fri, 06 Jan 2023 08:34:24 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:36e4:cfb6:3705:ebd9])
        by smtp.gmail.com with ESMTPSA id 195-20020a6216cc000000b00580c51341fasm1346020pfw.177.2023.01.06.08.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 08:34:23 -0800 (PST)
Date:   Fri, 6 Jan 2023 09:34:21 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     MD Danish Anwar <danishanwar@ti.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        "Andrew F . Davis" <afd@ti.com>, nm@ti.com, vigneshr@ti.com,
        srk@ti.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v14 0/6] Introduce PRU remoteproc consumer API
Message-ID: <20230106163421.GA2351214@p14s>
References: <20230106121046.886863-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106121046.886863-1-danishanwar@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> 
> MD Danish Anwar (2):
>   remoteproc: pru: Add enum for PRU Core Identifiers.
>   remoteproc: pru: Add APIs to get and put the PRU cores
> 
> Roger Quadros (1):
>   remoteproc: pru: Add pru_rproc_set_ctable() function
> 
> Suman Anna (2):
>   dt-bindings: remoteproc: Add PRU consumer bindings
>   remoteproc: pru: Make sysfs entries read-only for PRU client driven
>     boots
> 
> Tero Kristo (1):
>   remoteproc: pru: Configure firmware based on client setup
> 
>  .../bindings/remoteproc/ti,pru-consumer.yaml  |  60 +++++
>  drivers/remoteproc/pru_rproc.c                | 230 +++++++++++++++++-
>  include/linux/remoteproc/pruss.h              |  83 +++++++
>  3 files changed, 368 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
>  create mode 100644 include/linux/remoteproc/pruss.h
>

I have applied this set.

Thanks,
Mathieu

> -- 
> 2.25.1
> 

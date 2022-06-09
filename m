Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96973C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Jun 2022 20:51:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233035AbiFIUvS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Jun 2022 16:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232983AbiFIUvR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Jun 2022 16:51:17 -0400
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C88E193FE;
        Thu,  9 Jun 2022 13:51:16 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id y12so23401406ior.7;
        Thu, 09 Jun 2022 13:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6UkS4SPS1bXVXetBXdzfxgOMHLZzAndl0YdUye+T98U=;
        b=AtSPkpqJFBdhC9+dJeSF01DEYbEojYtB8jvxRfKkpK7vHVB5xYjZx6MpLh3A1ACI1S
         lHqKLU4kZ5miTorQ8X6aZr2LcfNd4E/+zorpC9L7tyWAPtbyAXsuw8NXQxcmPnAQx59w
         lZbHpPTc1gF1RSYr28wKWX+GtcCUQW5kE9GzZ01JSnx3UtlDGI5VdLmcsJJ3/CwnSOoW
         m+llVhuTESEUKrUGN5mr2WgzAnYPl/uhc9l1LT7o7jGE2dq0sZ1FC09fe/ZyHF/Xbn3T
         qKy2QOMLF6kECNv+H6OOgzdrHsH3iACk9iDF342ahalnbM1noJ6vS5sD6e7RoErkybgb
         Jbpg==
X-Gm-Message-State: AOAM530/iTzceDRPGg0ol0uU1rfB8/Iy9aJRmF3I9KLfmqG6RoMGPSCD
        GfWjCXn6+fQQTqcKfrfbw8vANbWZNw==
X-Google-Smtp-Source: ABdhPJwOVwZeLmYAjjuRwTF1mXzjxf7By9LYuIqGnacWdW2E6Un0R5tJzxy5bnVQ5rBRzs4VUQ+xzA==
X-Received: by 2002:a5e:c318:0:b0:669:975b:7d06 with SMTP id a24-20020a5ec318000000b00669975b7d06mr4223204iok.199.1654807875963;
        Thu, 09 Jun 2022 13:51:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b17-20020a026f51000000b0032e71f31487sm9867485jae.31.2022.06.09.13.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 13:51:15 -0700 (PDT)
Received: (nullmailer pid 78588 invoked by uid 1000);
        Thu, 09 Jun 2022 20:51:13 -0000
Date:   Thu, 9 Jun 2022 14:51:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        weishunc@google.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-kernel@vger.kernel.org,
        Daisuke Nojiri <dnojiri@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        chrome-platform@lists.linux.dev, linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v2 1/9] dt-binding: remoteproc: mediatek: Support
 dual-core SCP
Message-ID: <20220609205113.GA78534-robh@kernel.org>
References: <20220608083553.8697-1-tinghan.shen@mediatek.com>
 <20220608083553.8697-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608083553.8697-2-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 08 Jun 2022 16:35:45 +0800, Tinghan Shen wrote:
> The MT8195 SCP co-processor is a dual-core RISC-V MCU.
> 
> Add a new property to reference the sibling core and to assign
> core id to SCP nodes. Also add a new compatile for the driver of
> SCP 2nd core.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/remoteproc/mtk,scp.yaml     | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

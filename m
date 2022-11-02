Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8F6C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Nov 2022 14:08:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbiKBOIe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Nov 2022 10:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbiKBOId (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Nov 2022 10:08:33 -0400
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B94F4614A;
        Wed,  2 Nov 2022 07:08:30 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id p127so19266273oih.9;
        Wed, 02 Nov 2022 07:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QvcNddTXKKBwZ+urXBXv3TzoNuF7Bn5HOULPsoWyIY=;
        b=Xs9Mls8xC5/bXepD1nWQ6yqmUL1aGwR5fPzZ45h5FspOY3cLHy7gqs4Qn+CFn2roHK
         GW2vT2IU3uIFH8hPn/pJPBTScxkqXFSDNlAM96Lngs1soGnwti8gNYwUyo/ZQTsDRtCZ
         eIBF8stqLd2HqJibkNlEEpOqD6SofErxFzBLnw9B91K4m1PeRxjNMl2bHzRHoectHSxv
         3GofN0G3k/QWWepOAtmktA3ffsWRpujf7+L+02EqTLCK8jMzwW995SJl09z1SbDOIdq3
         4Mgqth7eLtOVLr/BllBD4XMrscnD+uDmBqwTdMYSAXIoHpzmiTD57/ilf4X9siLobMaK
         NIlQ==
X-Gm-Message-State: ACrzQf0oCeuqAiFRVjvW0iYAXnWe3Ye+CiPjCWztLDJzG1yfBAThUFcZ
        oBrKuwrzFZg7SJKtVGJvwg==
X-Google-Smtp-Source: AMsMyM6QVF209qs9DvlKoU3PuSWQgC61aGthVBmhLCIbNQc64NsMjehDIuFeqRt3ZVD3MlSOZ3pERA==
X-Received: by 2002:a05:6808:e90:b0:345:6ee0:9a68 with SMTP id k16-20020a0568080e9000b003456ee09a68mr13951318oil.173.1667398109975;
        Wed, 02 Nov 2022 07:08:29 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 5-20020a9d0685000000b0066c41be56e7sm4710485otx.55.2022.11.02.07.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 07:08:29 -0700 (PDT)
Received: (nullmailer pid 3726569 invoked by uid 1000);
        Wed, 02 Nov 2022 14:08:31 -0000
Date:   Wed, 2 Nov 2022 09:08:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     MD Danish Anwar <danishanwar@ti.com>
Cc:     Roger Quadros <rogerq@kernel.org>, Suman Anna <s-anna@ti.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        vigneshr@ti.com, "Andrew F . Davis" <afd@ti.com>, nm@ti.com,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, srk@ti.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v7 1/5] dt-bindings: remoteproc: Add PRU consumer bindings
Message-ID: <166739811062.3726509.6286171416225934410.robh@kernel.org>
References: <20221031073801.130541-1-danishanwar@ti.com>
 <20221031073801.130541-2-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031073801.130541-2-danishanwar@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On Mon, 31 Oct 2022 13:07:57 +0530, MD Danish Anwar wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Add DT schema binding for PRU consumers. The binding includes
> all the common properties that can be used by different PRU consumer
> or application nodes and supported by the PRU remoteproc driver.
> These are used to configure the PRU hardware for specific user
> applications.
> 
> The application nodes themselves should define their own bindings.
> 
> Co-developed-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  .../bindings/remoteproc/ti,pru-consumer.yaml  | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

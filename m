Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE946C433C1
	for <linux-remoteproc@archiver.kernel.org>; Sat, 27 Mar 2021 16:48:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B513661991
	for <linux-remoteproc@archiver.kernel.org>; Sat, 27 Mar 2021 16:48:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhC0QsH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 27 Mar 2021 12:48:07 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:33639 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhC0QsE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 27 Mar 2021 12:48:04 -0400
Received: by mail-oi1-f174.google.com with SMTP id w70so9029143oie.0;
        Sat, 27 Mar 2021 09:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GZvgYrXd+gYyswDRA1NJmT0R/qibTNr4J/+KHZnn1gg=;
        b=VHQ0ja9DjytkORC9b1TY6/tvl4RsF9KzBF7G3iKUCFqMoftTTNM2QznFDC0pV8WnND
         WKy9lbkTUQA8L6dfWcMmawiPJ8z8F3EThIMhasGCgHR3ehGZFBc5zFuVLXFzKxQ42rX8
         WC6c+AN43tafWiB7WqHELhdyuc8HSP8xLZ58wwSWBQ0511SZuvQ4I6qJqoL5QuWzHAPN
         z7DghCNtwUzltfZbT6ObVdOdnlWJ4VCbMuFeaRQy7PC6D7PQIPp6napp/D/1Ou4mT2Z8
         31hM6OxwI5ic8vjGDCAln62K0bfmatRYdAB/YHBxY1yQYj78Og0BdwHq9ebR1ekZR9lV
         ANhA==
X-Gm-Message-State: AOAM531+qQB9gvRw5Q0ItAAarvtp7bHBmEk3sIEAaD20oWO1OLkpfUu8
        ZMihvbqm1NMSseN5XmfBIA==
X-Google-Smtp-Source: ABdhPJwjJpIy5G2hvlYKEIbnr5J8Ikxikd8GNFsw8Aglffj0Uv0aUnNBasuSlRpeYpvzURTKTEf1zA==
X-Received: by 2002:aca:2418:: with SMTP id n24mr13299430oic.103.1616863683827;
        Sat, 27 Mar 2021 09:48:03 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
        by smtp.gmail.com with ESMTPSA id d1sm2573866oop.0.2021.03.27.09.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 09:48:02 -0700 (PDT)
Received: (nullmailer pid 227269 invoked by uid 1000);
        Sat, 27 Mar 2021 16:47:58 -0000
Date:   Sat, 27 Mar 2021 10:47:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/8] dt-bindings: remoteproc: imx_rproc: add
 imx,auto-boot property
Message-ID: <20210327164758.GA225310@robh.at.kernel.org>
References: <1616400763-16632-1-git-send-email-peng.fan@oss.nxp.com>
 <1616400763-16632-2-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616400763-16632-2-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Mar 22, 2021 at 04:12:36PM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add an optional property "imx,auto-boot" to indicate remote processor
> auto boot.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 208a628f8d6c..70aec1a2e86d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -49,6 +49,12 @@ properties:
>      minItems: 1
>      maxItems: 32
>  
> +  imx,auto-boot:

'imx' is not a vendor.

Should be generic?

> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Indicate whether need to loads the default firmware and starts the remote

need to load ...

> +      processor automatically.
> +
>  required:
>    - compatible
>    - clocks
> -- 
> 2.30.0
> 

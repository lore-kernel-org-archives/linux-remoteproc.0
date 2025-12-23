Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364942F5474;
	Tue, 23 Dec 2025 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496557; cv=none; b=NGfG9L4V48H5gNW/6SkadqiF4JhxeE9OTfCFQcYaOZqE2DL7l12oejcVYs5HEILtGRT5tzY7+CC2r5IccaYC+IvodtZmtqzM6MQRZlOIYkBqakaSvmN4Y8oXrrrtweskKo9wJplml5MdMg+tkObkNdCKdlbYXHEJg2RaVfqrwo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496557; c=relaxed/simple;
	bh=JZWAlyUrlKyOOwYtREmas/qP136s8GOhnReNHA0gubA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+oeqxtj/xEvig8Iq9mlI9lXS1o+Hqir05ssHit1QHdR5tqb0eGwXAfGte5qfVWYj3hd0rySblXHbSTnObuM2MAHyZ+V1O0wUGtD4YKwN9Y6K57Nd8zG/uQmD+QMRM4CRwJdoAi7GM1jsVT/iCeuViUr9Uf4dj646ccMUKd5Fas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Huyf8TTc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Huyf8TTc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8BEC113D0;
	Tue, 23 Dec 2025 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766496556;
	bh=JZWAlyUrlKyOOwYtREmas/qP136s8GOhnReNHA0gubA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Huyf8TTcfgUqsI6uSudhVZqJbDsCMc1rXlWLlCbvxyOEfrbHnRZC/telWly7SAosF
	 ce1nhDA9v7kUtU8JtyB8AOIgNQw5rwUKpPDEjBujxlzNDBze0BokbmfHlAM9OaWorr
	 kqKOSbEFP9SnxU6V/lT1x3pTxTlR7GHjfvk/ZGJ3XSjyE3cIGOkSkgwcuZbcU7GcvB
	 8FuYeYh7T2xa0EqkhQX4jeBeN4Q/f3MhSVZMWQjtQKBQsg0hL2J7aeqJv3/pBuE9Ji
	 46z1L0CunYJQIVvLqTcZjInTAJlOUczn5ukhiarzR0bbqrXhSL7+84wfIhV2atL1GT
	 uggKZ7nobREeA==
Date: Tue, 23 Dec 2025 14:29:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: remoteproc: qcom,pas: Document pas
 for SoCCP on Kaanapali and Glymur platforms
Message-ID: <20251223-furry-mighty-agouti-a222f7@quoll>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-3-5b09885c55a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223-knp-remoteproc-v3-3-5b09885c55a5@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 01:13:49AM -0800, Jingyi Wang wrote:
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index 63a82e7a8bf8..149e993282bb 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -33,16 +33,22 @@ properties:
>        - description: Handover interrupt
>        - description: Stop acknowledge interrupt
>        - description: Shutdown acknowledge interrupt
> +      - description: Pong interrupt
> +      - description: Wake acknowledge interrupt
>  
>    interrupt-names:
>      minItems: 5
> +    maxItems: 7
>      items:
> -      - const: wdog
> -      - const: fatal
> -      - const: ready
> -      - const: handover
> -      - const: stop-ack
> -      - const: shutdown-ack
> +      enum:

No, no. Stop doing random changes. NAK

Now you remove strict order (see writing bindings) and claim every
device like SM8550 ADSP PAS has any order.

And it is now de-synced with interrupts. Read writing bindings - this is
clearly described there at line 90!

You can only grow existing list.



> +        - wdog
> +        - fatal
> +        - ready
> +        - handover
> +        - stop-ack
> +        - shutdown-ack
> +        - pong
> +        - wake-ack
>  
>    power-domains:
>      minItems: 1
> @@ -55,13 +61,21 @@ properties:
>    qcom,smem-states:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: States used by the AP to signal the Hexagon core
> +    minItems: 1
>      items:
> -      - description: Stop the modem
> +      - description: Stop the remoteproc
> +      - description: Wake up the remoteproc
> +      - description: Make the remoteproc sleep
> +      - description: Ping the remoteproc

So every device like SM8550 PAS has now four smem states... without any
explanation. Read writing bindings - what does it say?

"... and define constraints specific to the device."

"DO define properties in terms of constraints. How many entries? What are
 possible values? What is the order? All these constraints represent the ABI
  as well."

It is your homework to read the docs. Not mine.

If you want to change common list you must define strict constraints for
EVERY user.

Best regards,
Krzysztof


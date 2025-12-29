Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9ED287518
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767005981; cv=none; b=VNJXPyaIRRCKas4zlPAtWXKL3t95Iv7DnkQgZazP6e0CKrHFQZwweE7XcQpSG7Coldv6gYtgyOFJfwhDyu1e1HS/HPuvwZltYv7E5bAVGumsM7ISrVCGeQ/Q7kWRXVQ48rbkQY9z4yTw/Ct2m0Z1yKqhyHdMc/PFkTRClAzrwkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767005981; c=relaxed/simple;
	bh=qI99lAk+0gUGou58rrOwfp3qo/aSid+2yiVp9bsHhIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eae3dVZAjnlknEVmFebqBfQB5HirKGu8LJff4CukxXiANkCfrruAGEba+MGVk85kXTm3MOiCaAOeWQylSvkdnMnhvUmHJyrwVErEaXY3wqN23oBkhyAg+cDYxNKmN/r8LhYwIyYAMlf3QAPLFLwal+8SU1krqkiXT+EJZraHFIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYttBIH5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JYttBIH5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7ffa421f1bso1712340766b.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 02:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767005978; x=1767610778; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=njF3If+p1nCxAl4swFbGxNUzvThr1OLNlezuMAThPIE=;
        b=JYttBIH5bXa+QizJ37k1tK5SnwN9VsauiRaQFujDJSPkFL3icMsO8re4UjsHKVB80l
         Ug53uwHgJuV4yCwgtTLcSFp96hVlvbZW14RhWM9K8HsGbzaGhl1z9SJtkX7klnn9oui2
         hwHY86Vym+SYugas3dKSHJHFzSg6y7fjI3uE0uRqYcbKnXG/Zuz1jx2V/oxMckRW33m7
         j9PB/Zk+TcFZMopHwSIOmFdI2DtEF3Txhm8KFVMKUvo2DuDqVxcQkVDaIsSh0y84nN13
         nmQ4tRBwOuf6gjf8FAjQzij9qGAbYMuy8XBCvpjgfOrBjT5Fd6WviZH8Y7/6VYGK64Hc
         b/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767005978; x=1767610778;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njF3If+p1nCxAl4swFbGxNUzvThr1OLNlezuMAThPIE=;
        b=bl5NrZFNToZ1pi98HBDoOPpkMqIDoDtia/kXFVzKkVstwMfcqgJh4MIShpIoYI/Hpc
         Tr00P0eG1z/mquBGUPFYkpEC0z/cfQPh5STUbFpI+w6xcbdI4u6Q9DjoEktudndN8xjf
         +M1YHOAeuCsHeOv9Y1RkJMEspENX0Xt1GLtpqto7TmK36we0gA1xBKQpSAcerfJtbfQE
         cjawWR/ijqICIN4o/70zZvRYu6S923S/BV4BNM+SjMd0xIWe9QCfvg8LibRPkHM+f5mv
         lVCZnXpcTtjmakBfMSWr+8Qic0jtd7XWZAAJsE6CGKI6GlpVhXCfjfjjqETG670pZ99W
         RN2g==
X-Forwarded-Encrypted: i=1; AJvYcCVzeJGnK2Ksl7XfIXRjBXBocRyD4mgVtCaViCxhMYwse0tdT+QqvRuWF4artmvIgUt49aRfA/uv6qWNsQkmYruc@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNDrz3KgIVwebyy2tjfF4t2kEPq2s2N8vgPrLnKxOdcFluSdp
	yELmuGAjlP0sE9/snRVahKNKdJdQUu4DwnXNXapWrwmunLZL/IAe8I+vARpeKRHCwuE=
X-Gm-Gg: AY/fxX6F1/sA6b/zoPL4s76VWoTOqomYp5SMZmsa3tPKZKyIh4jAav93TPB4pgptQSP
	k2F1bYduouc17vuEWLoTahgP868aENoD566opaSjbBfZ/Pmb5ZL9VZUGqZYCwcg2XGS2guIIPer
	wLZgd/sUpWM0CnS2P6+or5yYG2H7f+VtKphFEtmwa3RZrtoXZQV0jPnQpoG4OqSUzq+5Dk/MwGO
	Wxg0pirVwdae4du0Sr7c1OZiD5V8xnIF2DR4bpcoGqA4Xoej5DWrcIbuK6qAFeM0QZXPMOB33Ae
	gIC3Z26qnJc3G80qHb0DmU/noOSQnFjHEeWd9xbmLdQA+oinDFKybJH8tqv2YosyGMkiN03N+G+
	enWbcuxxtyymf5GNcRRkUps07vFyLNnVhuzBbG7hW2Ual0esW6l+ulQWiCr5fYqg1VUphyyi8kM
	1YgD/3PmpnH2YLObua
X-Google-Smtp-Source: AGHT+IGmNmtf0hLYvfbaFryeXAFTvtNFvh/bM96d8IqdaTl0uOyR4Ykkp83p39KQuQ94AnUld/UYAA==
X-Received: by 2002:a17:906:fe42:b0:b72:b7cd:f59e with SMTP id a640c23a62f3a-b803561a27dmr3525136666b.8.1767005977915;
        Mon, 29 Dec 2025 02:59:37 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0e8f1sm3277759666b.53.2025.12.29.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:59:37 -0800 (PST)
Date: Mon, 29 Dec 2025 11:58:19 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MDM9607
Message-ID: <aVJey1tQ0mlGdcGM@linaro.org>
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
 <20251228-mss-v1-1-aeb36b1f7a3f@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251228-mss-v1-1-aeb36b1f7a3f@mainlining.org>

On Sun, Dec 28, 2025 at 03:21:51PM +0100, Barnabás Czémán wrote:
> Add the compatible for MSS as found on the MDM9607 platform.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> index c179b560572b..b59d6fe091a5 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,mdm9607-mss-pil
>            - qcom,msm8226-mss-pil
>            - qcom,msm8909-mss-pil
>            - qcom,msm8916-mss-pil
> 

You need to add the new compatible to some of the conditionals below as
well. In this case probably everywhere where qcom,msm8909-mss-pil is.

Thanks,
Stephan

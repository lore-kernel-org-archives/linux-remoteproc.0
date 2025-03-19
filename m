Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD26320897F
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Mar 2025 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742368603; cv=none; b=GWb3DG3xX7qWESc6qkYuRCt08ZHCoqFRaOYpN0NNfHzT0g0HLdwtxKPhlubSLmuSZRUvWXA0zNcirya38io+HR/QOIIFtEhtyUfntAIsk2YhyuJFaya28oYRT6SlScDAFdaBLn0bHeYi+uPMdk1Kko7mKIAhfZb/prVCOMDbXgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742368603; c=relaxed/simple;
	bh=lVO4h/mJkxrAXfVrEjc2UlK7pzL9QxZQba/hD5bTrSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7Vg6+UXJMBk/pKv52Z1NIcElt9KZB22dQcgQGUtGxX7JRI3fIpNr7lA9tCUy5U6SOypVLlM8YoM3lNLnE2NYfkYgzyy7DU2WDP+3w7S44D939e9YQRe5xuPbNFUAKKIQwmLmkVIiVBep2smKtEslFaiqpyg44/i8J/pmQorACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TwNrWb1Z; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TwNrWb1Z"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43938828d02so6873185e9.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Mar 2025 00:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742368600; x=1742973400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w2XqsxBfEStQaOCaRcZuCXd94NPuhOER/mwaluYTki4=;
        b=TwNrWb1ZFmQJqs4SnQlMPPG2IQ0/65a0whI/Ns5TKf/SGUmZcTlRAOjnCsr8XkIVet
         p6PQkLYgs596elma1reFb29VU6LpZ7GxKTDHa7iXuomM9x2vmjrTgmqhyeaQlqVlyVhm
         OoZdRWhzqWa6QjQ+9sF9V21vvM9KQoWsaOEG0cPIlVTDRtcRUeenZnfALcMm8zrPIIxX
         VJQGJvAX0iaCr/bAijghYyHWDRyDXXvg9AkYyDvL/t8n+eZkTtjUmmiHE4xLO+gGrqJB
         9FbkptXmhOCuViTyAeQxsxS+D/uVc0xvXFmm28593kyE//u9mLRqG2XL8MBW+CJn5bRd
         L5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742368600; x=1742973400;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2XqsxBfEStQaOCaRcZuCXd94NPuhOER/mwaluYTki4=;
        b=QzpFW/xbMvtKhK5sXiueVSiejXR81XYeYZhyLMxt3/Rg9llXKE75kgd7PnHDuQPB9z
         0h4VaPqSo/ovcjWw3vfz5B1oBE9GuIeNMbyvmAa2ofxJxsTjUFIjjpinvjZC0Nc7BKAi
         oyq1N/hBU/dCIaueytujXt25cKE5yj9hKRC5GDzSaZoSTclYvpczWCAXyaB0jLvAW72x
         vfDbMpbAnb4jtCn0TFnnLRvZDS7uD78s7frXkDuQrmU3Q5zPHHljXkmdqdouqpUfj5gF
         /VXzanhdbwdkvS0Y+TVwotrplfx/GBHGZ2D9gK16rY/kakBxuAytTJzBf3svvEmdO3h1
         ZsTg==
X-Forwarded-Encrypted: i=1; AJvYcCUDQ82KEY2hZNNgAbSBirkJeD8/c/+BzNn+nPajKKr4annq/5GyzzhX5cZzk69BOIEQEPsm5n8Cv5LuGclgVn/p@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh/sH0h/6gV87jHXbyOIq3VZKjIIZABO/foI9AO/OYkkY5UZMD
	G8hkljSK2tLLwnavNanAkyvIuWeuf9LWUWRyh0Of4l9UWd+HWwtVcR98NP4GDIY=
X-Gm-Gg: ASbGnct60o9Hn1su0PX3EdlO7zLf9hEhQ9Z3gfruLEuVCBt7smvGl0s9whNhNi7yTi/
	ct15XJOgtmvF/HNxGbjtIH008f+nNPt91Dap5TM8gaUHRjWiVcsXIrVkd//MR0ZrtY4mR9kZsc+
	RvIGD0B6TA8hfWa135pmGIOIetSdNW5g26Sod0c+TtCir/EHfcljjebsf19aTm6eVcb2fA5QRYK
	vBciMncySNaKgOqED061w37BmrwF6iUbA1wVkOsJUhVjGPhR6xNrhOcIBMd7cdbpxiKLtdyipoK
	tBir2thoqrHuTbe5axT0bG9fb1WrWop6paKLqOYDQ473bu/MCvXOdJqQCKmqjKY=
X-Google-Smtp-Source: AGHT+IFcR8TM0tkwiPvEfeHGXy8syzRhG6/CVprTPhxIrgtzOfrmtiAen0c0L7irAhuDeNCxuXOBYg==
X-Received: by 2002:a5d:5f82:0:b0:391:42f:7e83 with SMTP id ffacd0b85a97d-39973b2cb14mr527211f8f.13.1742368599911;
        Wed, 19 Mar 2025 00:16:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a96sm20469405f8f.69.2025.03.19.00.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 00:16:39 -0700 (PDT)
Message-ID: <3fa1573d-e3b4-434c-867d-38fa69ad3a8e@linaro.org>
Date: Wed, 19 Mar 2025 08:16:37 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: mediatek: Add missing
 minItems for 8192/8195
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
 <20250318-scp-dual-core-mt8390-v1-1-8733e192cc73@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250318-scp-dual-core-mt8390-v1-1-8733e192cc73@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 23:22, Nícolas F. R. A. Prado wrote:
> Both MT8192 and MT8195 have an L1TCM memory, so it should be described
> in reg, and therefore reg's minItems should be 3, as is already implicit
> by reg-names. Override minItems to 3 for MT8192 and MT8195.

I think that was the original intention already, because reg-names are
expecting min 3 items. Basically you just correct the missing lower
constraint.

> 
> Fixes: 6b55b1e2fd7f ("dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index adc6b3f36fde49eb3fa7ed3f08b0fa9e7f331162..ee33c233e44f3d51f0851b35697a24208c87f68a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -185,6 +185,7 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 3
>            maxItems: 3

maxItems can be dropped.


Best regards,
Krzysztof

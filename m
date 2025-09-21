Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7562123E334
	for <linux-remoteproc@vger.kernel.org>; Sun, 21 Sep 2025 21:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758490383; cv=none; b=lNMy7Xl9qqgLPRrpY3RC+WuW7rQ77jVe7skAwqVy3gNS0Xq372c+dadMLuWGTc/KUHahlCsWTfF+e35XISYrh/pnc4Ygc7mEUzJPTyI0mNiNvDL/WzaESdAaj5nk9t4ztqX6mazjRBRfLHpllAvDFiiLEs+/UaH+D4NNINqzZ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758490383; c=relaxed/simple;
	bh=6ypWfiZHJzX/xDZsK0T64csG57qQjcut8czBqxy2qWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3qcTwgSX/zkYG97LQImLb1QSmr1V8ZEHhD0+UBvGLD0HyVT61lWu8R/IN8E+1wI17Qs047RapsCJOyee4WyXKAj3XhBD4hl9foVB2mnQS1NFstIapIjlgmvvQeXSHTUddcG8BRGsMbuf5ejSYJWSg2tCyiRKkFChBMtr8+McxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LqYHalk2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LqYHalk2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46d25f99d5aso2184935e9.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 21 Sep 2025 14:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758490379; x=1759095179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WcyVlJ5ccBg3OsxdDlx685Nr8K8wL5Pp0q8kjSCRzk0=;
        b=LqYHalk24oU89xEtZI3ebBI005MzS7y8hjblvW2vNhZpD0St2kkku6uWb8Lef/Rrxd
         162YzkAvuOaS8bJCmQOoyNzCKNeBtUTFqxX1jfunLb6unKIETUEcqiPyOqn+FBiqmv87
         V/9uV/btiIFUr67/ZSm8oAkSYLRoTUDjyx9kRT6t7g1B5qRIdo5klFTqW+A9FGUa4Rof
         X5H3ZxwinwQwZ7VyJ+C43LkBGAMs6H/ntkr4PEVn92l4KWrzaLpCk0ZNVzWKH80H3uJs
         T3tFCvkRh9C9RmVhcavG8W7/FWNSDIGpIIouDEUudul8H0N6hTvt4W2zDfl+ak3DJDWR
         0G0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758490379; x=1759095179;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WcyVlJ5ccBg3OsxdDlx685Nr8K8wL5Pp0q8kjSCRzk0=;
        b=TtQfroI2P05WS2Wn3TwybLLLJNtSFS0eX4XLjv0O/DzNHx5vH5QJMmvlCgjKEjgSfR
         5olOH849Aj1Vn1cdUG5n02UHMsA42eAOpzUU5lksdzZpsVfTJTczEIqqFzmc2iO+9R/E
         8FOU8+asqHY1DoU0Fnph2AfyPTMyK7aJucd96oSYNhQPIFVs+vKax0JmZqpdL3fmClQk
         7clg9LuIKqSM64FzA95BmAU8HwNI8awXPrBhLhbsSpEUXW/DqZsezrSGJw4qCoLD58LN
         osClQht2lJXTsJENRIUSJHA7XLATEz8X+P/KmdnvUeYCB0uJtbfcPVjPT8WtJEnL3Hqr
         KTMg==
X-Forwarded-Encrypted: i=1; AJvYcCVDHi0B48FbwAHIL68V5bJOWsZwFam34MIFQWcLcofve5GIXqbKBRXdp+yc2B7hgKoFgo5IFI2yvzy1GqRu35sl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6RfmACdgMUupueOQBIxYcEDN8q4DGSIRmZ+wdoez3uJyJrWwa
	BuSgkOCimcI8x4A2t7YJrzFs9jNKGM/KSRkFFLN0S5QO+Meu3eBR0WTU/xIjlNQalg8=
X-Gm-Gg: ASbGnctpgoS3LAw889Yk4nNIYKOV08sWylGo0Sekf/F7POyLiGnnOglFq9OJNtZPEj7
	w9dnRhecO2hGKgfIbWlFkGv87Oht4Z2u70bTvg6sOHFFPPvnjPahpLbzJ6SScxr9B8q65Xl2y8U
	Teo6x0iwtOzug4BCKYM1ZKIkkdlFERxA8T89tjQoagMlbHeml90CY6WtUGBdms36luYaZRoTB36
	2ahnm4Pm+aXcBLE9r7ULbspoPZS/fo+Lbo6JV/fmaHszwtota2pxbMupaTVM55WqHSaMYblkeeK
	zFPfm6wcmKG7MMCt6HQGfaGW+8uHicKlJGRWQ5bP3Fhs3nQCfBbl9kXpCg8sFLiHFSAEV/c0BNH
	T+rwx/ATdhIH2jUEVicDumdS20gDtlwkUZmfVzzvXko1nTFGxdOt75hKT8npL+aQOQB5yut+XFP
	m1tIyYHOz3RsC4/9Kh3AeQ1darERZf/Q==
X-Google-Smtp-Source: AGHT+IGrFtUS6kuiPjXUW8VEeVl4lEajrMTBX6lS1ArstWn69VRG3TQJ1C8xitL4/hpLzTt7MqEPSA==
X-Received: by 2002:a05:600c:4754:b0:458:b8b0:6338 with SMTP id 5b1f17b1804b1-467a7f111b4mr119477045e9.6.1758490378901;
        Sun, 21 Sep 2025 14:32:58 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f4f9f4e4sm196526075e9.13.2025.09.21.14.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 14:32:58 -0700 (PDT)
Message-ID: <f3b384cf-bb2d-4476-b97c-1f63dc64671e@linaro.org>
Date: Sun, 21 Sep 2025 22:32:56 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <CJt90J07fyMMpE4e0cdA57Hr2SAcSOfVD1Y2NWFfICOWw7rfnwzPtCeZnR9dGbu_uYVGKezX9spjUO89uFFMPg==@protonmail.internalid>
 <20250921-kvm_rproc_pas-v3-1-458f09647920@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250921-kvm_rproc_pas-v3-1-458f09647920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2025 20:40, Mukesh Ojha wrote:
> Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
> configuration for remote processor and when it is not present, the
> operating system must perform these configurations instead and for that
> firmware stream should be presented to the operating system. Hence, add
> iommus property as optional property for PAS supported devices.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index 63a82e7a8bf8..8bd7d718be57 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -44,6 +44,9 @@ properties:
>         - const: stop-ack
>         - const: shutdown-ack
> 
> +  iommus:
> +    minItems: 1
> +
>     power-domains:
>       minItems: 1
>       maxItems: 3
> 
> --
> 2.50.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

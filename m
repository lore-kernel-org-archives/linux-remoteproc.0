Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531547;
	b=HhCBTWDFmFQ83jolaVAr3D7frG5kMsiqtMEYf8ItdBdKlp7xdLL91HfbmFCq+5m7Mdjf
	 e9m54lWymh5/wqGa9Xsga2VUrJMsr2JByhLPQ/cjOhfBB1Q15XjnFbi043WNiEVpgYOK5
	 zfJTg8LYrGIZLwpGl4wu4xLC9Eu2N+Zxs3RyuO1OQSR81t6hop8ya6ebljKgqAh6Y+1Sd
	 4j65IfcPKV5kspG6nnC9oMYOmB00Pvy6rfVshDGs/P8o0JtkSjbRMeuTSSI/jRlATXDdn
	 NBVHYqxMnPTBbmMFcC4GMnNh02SqbH6vtoiT4PQJowxwhwQPiuxSKPKp4cpHxB1sNAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
	b=tOK+puB4+Y+ftF/CFaqA8ImwdUh+AfpvOBRzz9blzhuwQ3qfYe7PZCXU4T7ZsBzUWOBT
	 MwOS5U0CuicvjaURP7GjtqWswr6i80PfIybbNz2V6dBqWjU+XdpsEVIKziFI8v6dTum22
	 wzc27LWrV3sW92RQgJHPD4YYbWSBYQH4/OakMFoEIdYsO7U1kP5rJ+dqs3isYg+FmghbD
	 Klpa3y058KIQ1tas8E/u/M4Ra4756UJ0mOWreLqoelnao7qDWe7A7clWXYx6XQhynW7mR
	 o0P4yd9+mbQfC1lq7YA2iLtOGdZm4Y/HqYVkgnqTKY58ZcuUcY2KCLQz1Y965GFxCfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXwA6C2X;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7295B606A334
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 00:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7295B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXwA6C2X
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1931ff67a29so52950c88.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 16:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794531546; x=1795136346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
        b=aXwA6C2X78/aErlxdCDVlDcBhkVNyzQp81N3HP+FcVhJ/FM8Ts6K3OTLEdrDTNlTZC
         PZlGbsKqFdepUhhUwf0PTM4/12NFZOmop3SMoBLlrEo2OKDYLM2AQ+eqSG4n7pA3N1pj
         r5tFkM5LxFCtgMVGCSfAjr7e5Ubz2hvSMv3cYF2jhO92/gHpAxYLlGhuvE8Oam0NBvBW
         3d/2C//L92CiXCNnqw6r0R+4t9XZfGZjwz1VoaqfrCxDktj2prFI3iKcjRF+UXFn16ap
         6K7zLI1kvvv7cxwwJV6+lExKlmTZf4DnCTPEVPaKT1VACLFTNEai51iOa/kMF+qrecyi
         rbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531546; x=1795136346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
        b=DuaIrAiv8RYoAGd7Q/xeStzRJaA1K9fwtgurCSH30J7wsDnbBHq9obNkRPFG234rEf
         7k05x05TqVYkfN50kqUU7pXINsyD28xIZMVE5Lp1r+CvJUt++zWODpP+ZNMZwPBXgY1W
         ZUUHPcgiW0JsdZIlJ3ajOpdncmIWZzcCzrjhII9GhuqL6LOJ9MUOZ7mUMrkq5bqq095x
         cVapGksj0IFX+u3hVsqyJ64S51Lll8fDsXr4kwwBviC+2HgOCcSrkjhjUE5ApcbSkKN+
         gkXVgvwTtgxaYwfz5cRu8C6ydhQv/BbZADTCmEYPL4mOcW49+A/RZvP3UjN0wYdHHQl0
         xlsw==
X-Forwarded-Encrypted: i=1; AL+hErFJlAqzHX9SYx8O08G2hNXYYWiL6Y+5kG4F+7imB0DRt+hpPF4NJoNIuBN7MbQpfg1A/QU9/Y4Ujub+bzsupL8u@vger.kernel.org
X-Gm-Message-State: APuU4Z9aDVgoUufm2AVS05quxoyJS+8Sej50L4ejA+KFWvR6UDGTaU1E
	fPpcNIs06Mg6eFGPOhoHFgQKbcmYgX+HheJjaggt3eWeYmFaRe739z7j
X-Gm-Gg: AYBFou0Dg1dOf52ZdSBfNMFDVoDI6NUkYD/YEIOD3iCz3Qd2QPQId+D/0B8Q54ieScH
	i/SPYUjESESyVlx6z/jpbHUl/HZ3UCHUCvsNN6Z90h2JnkJmMMOWPP4O/Mxi456uMDCMwMd29cs
	u7cewIuQyX2P81uIWYXvbM+qAcWsnS909GMeul5mSTJgATkNCwHcjXbEdY4iSpaNTJ/Dar8C33S
	wjrDYdhgQuvZRYI6sDI0qtYEme/1Qt2P8QE3cWEGaf7gLHmQD8xi2hwomBZruKwWGzabvffPQaS
	Av7nqTK6x6sVO1J6iP51cOVwmBI792RdZhFPOxcNyTTRsy/OKatm+267wV2NozznTXVFBm1gTAI
	YK+8TyF/T0fKRCrxCO2uZgqOYTJmK2J5gk5Nc+lYVJWVSL6KwuIYkRluGQqdQ6ZrfOUGaZB1igW
	psKwU+nFs/RjikM1rWA8ismSr8UIBKdsqGFhb/J58E4sVbpG0H/nMl+yZiV+a9HUFdmqkntm0gr
	IbJgaC2b4Fl0ExlYo0HQq3StNjIHJvfCCUVvTyA7El5Zx9kkqyDJ9pi3a7gxx/28nWGrS9v6b95
	k+oLRy+Ije2lOZPWd4y+VnRNPPktOk8rd47TrtXANjoOSi+LNIwmUW9DBmPgIV4y86pIj9Q=
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr1197809c88.19.1794531546379;
        Thu, 12 Nov 2026 16:59:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm2760431c88.8.2026.11.12.16.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:59:05 -0800 (PST)
Date: Thu, 12 Nov 2026 16:59:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: muzafferkadir@mainlining.org
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 10/11] dt-bindings: input: touchscreen: goodix: Add
 binding for GT970
Message-ID: <avZgzxJtnMceNQnJ@google.com>
References: <20261105-msm8952-initial-support-v8-0-311ae8e8f14b@mainlining.org>
 <20261105-msm8952-initial-support-v8-10-311ae8e8f14b@mainlining.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-msm8952-initial-support-v8-10-311ae8e8f14b@mainlining.org>

On Thu, Nov 05, 2026 at 01:54:14PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> GT970 works with GT911 driver, document it to be
> used with GT911 compatible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied, thank you.

-- 
Dmitry

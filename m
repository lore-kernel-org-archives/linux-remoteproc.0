Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A671FC109
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737969567; cv=none; b=GSzQgl+l1qi29YKNn0J0LFRy8E75TA7EQ6MhUS7EZ5tkU1eN5uYzoM9YBiUxE69vHrarKJTnMDOyZlQ9tGxJEwH1x+frgpleXEH/Z8JHJ+NP7sgg83mi6guv30MnksOutgc1OfF/j7Q6oVnW3s8ycj7k/O++B1AzSo8khn4QIZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737969567; c=relaxed/simple;
	bh=9/1eFkMbhlyNzQK0zxHdGjdZ45bU6EV3bHiGqfEX/FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtDOVHXXHBjxkxE6y7S3l6UjlC8dlyrKgFXdRGpxFRt5ezDCJyD9Yt2rMZApDUNLvlEtA3G5RsVR4wKpTDXrByBDgL8uiuRieAI8VcOVObgtAWhZO/uRUfKf4xq5QKecLIWx2x2eJCo3x06gyifM+0tTMO1v6aCD2Yz5SaWfiwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=imBng/mE; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="imBng/mE"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab68d900c01so285991866b.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 01:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737969564; x=1738574364; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ns14BzOZma5VSqqkVW3NbLI19BCWZa5f2OVnRE8Ni44=;
        b=imBng/mEX8u/CEUAHp397+i/MTeFHQHffShS83TNkL+V1qi/i1LAnH2CN5Wmav/9vM
         Sh8/ZU0t9PpCnQQe5Ero9sfwpys5syi+8iIN7LIsNm1CrILb5mmx3inZxu7oJgH8lukH
         shJVJqwl7V0JdBfYEZtkL4i4qplQWFXmtrstSsMXeRIVLGbqbY8T6gpfA6juSWBi8zQn
         y9KqT+JYYCzvx47uMDg5ifdZHEMZfRqBPmenHjjSrq4Fs66dQnyr+QWF/XLnfPyFarW2
         akt6gQAa3laWhc8P2O4w02ZUt4MLdPBUolz1Iq76MA6yptkFpHA8q7354vucoZ1p8zgA
         3K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737969564; x=1738574364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns14BzOZma5VSqqkVW3NbLI19BCWZa5f2OVnRE8Ni44=;
        b=MoJ6biA438AAHeNoaWT3TNizRJqD2DdNmDHh14XkHdeMZPfNGa9+ojsysp8/p7omb1
         qmQ10c4vhX14k7Oi6A+rf4fa1+kDv35Laehq3qknnHdWeYfsDR0fbdanVbU5bdXnXGYT
         GYb3x9IURs1ZttzUacd/XwBuX7W/zwnOWSQ95nIOeiuFmBGAuta7X9NbZtqSZHAxm9Bf
         xf6hErasS9i6e1LOjoSkq2OBJ2m+SvPVbAILL33W2YMGOo59uAmUwHtKYwcdBe7Szss0
         4Oy5pa3k3GOGlI0bfX0hWydSpoc/g+vqDDac1PrgoBEZovY1MxYJhwpJmdCdA+HByxxO
         g3YA==
X-Forwarded-Encrypted: i=1; AJvYcCWj57aoe26IB4Hlr8cfunwasXgdCYiBsaZDeoQp8H7y9kRgIv/bn5zTD54Svh8EMOEyt/WNtJ4iJAtE7Da7P6Tu@vger.kernel.org
X-Gm-Message-State: AOJu0YzGw5TOzc3w94ejjwDbreWcePdDFXTkSQoyT06gi67BdAN9vgJq
	k8zcuR6QL4G9ek36jR9r0iWmC2R/vFvkKi/jiDXwzv2QTDpGi1ZRlnJ0FG41hjI=
X-Gm-Gg: ASbGncs7HNGQW/7R/8j0MXVePl0K206XgMpQi8TX9a180fzMYmoSAfoyNgu9WvkNS+i
	z11HeHtyc9ZD/xa9Fi4eU4UKLdJsILRddWHMBuaR6jvc7UGjFbf6dDRbvFRzcdBSZ2fPNCS+F44
	6Q2Lj3uh44uHcn9SfU5Gznd8tWgVdqZvmo8mXDWVm9lcEhIvfQ44STwj3AyZs9JZtDtIO6UpFpo
	JdU/OMZVn+n5dYvajULD14HhD9rNs4YlBe9sCu4zK9DDxHMuc5uzjeOpUs32MbSS4W09fxUtRFU
	nQwg71x6yU6FLZUV
X-Google-Smtp-Source: AGHT+IGIbWOkeOIH+HEPI6RlesPzjwtnrNcMXE6wlcMy7kUftKsZDhvi22QvFpKQMEzXkFkXiKQDTw==
X-Received: by 2002:a17:907:72d6:b0:ab3:4d1e:4606 with SMTP id a640c23a62f3a-ab662910720mr1514830366b.3.1737969563971;
        Mon, 27 Jan 2025 01:19:23 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:f64e:7d70:e55f:6da8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e8b01asm541488066b.84.2025.01.27.01.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:19:23 -0800 (PST)
Date: Mon, 27 Jan 2025 10:19:21 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/9] ARM: dts: qcom: msm8226: Add modem remoteproc node
Message-ID: <Z5dPmbZY6h-7LGqS@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-7-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-msm8226-modem-v2-7-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:26PM +0100, Luca Weiss wrote:
> Add a node for the modem remoteproc found on MSM8226.
> 
> For the apq8026 smartwatches, delete the modem reserved-memory again
> since they have very little RAM in the first place anyways, and all of
> these devices don't have functional modem firmware anyways - these
> watches don't even have GPS.
> 
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../boot/dts/qcom/qcom-apq8026-asus-sparrow.dts    |  7 ++
>  .../boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts |  7 ++
>  arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |  7 ++
>  .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |  2 +
>  .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  6 +-
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 80 ++++++++++++++++++++++
>  arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  2 +
>  7 files changed, 109 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
> index a2ca456012f1a070afc2805ae71ddbf6f5aac607..816b61ea504ee80d86dd4ccd1a15db687f6a91ff 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
> @@ -9,6 +9,8 @@
>  #include "pm8226.dtsi"
>  
>  /delete-node/ &adsp_region;
> +/delete-node/ &mba_region;
> +/delete-node/ &mpss_region;
>  
>  / {
>  	model = "ASUS ZenWatch 2";
> @@ -82,6 +84,11 @@ bluetooth {
>  	};
>  };
>  
> +/* No (useful) modem on this device */
> +&modem {
> +	/delete-property/ memory-region;
> +};

Rather than putting /delete-node/ and /delete-property/ on all devices
that do not need/use the modem, I think it would be cleaner if you make
the remoteproc related reserved-memory status = "disabled" by default
and enable it only where necessary together with the modem. The &modem
itself is status = "disabled" by default, so it makes sense to use the
same for the reserved memory as well. See e.g. the existing usage of
this pattern for &mpss_mem/&wcnss_mem/&venus_mem/&mba_mem in
msm8916.dtsi. Then you can drop the /delete-property/ here.

It would be even nicer to use the dynamic allocation
(size/alignment/alloc-ranges instead of reg), but I'm skeptical if this
will work properly on such an old platform...

Thanks,
Stephan

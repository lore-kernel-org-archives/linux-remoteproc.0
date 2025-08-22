Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29402EC569
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755852389; cv=none; b=u6nmh7i1KqEFt0H1Cj+uCnNlghrsGa2zqt5d+Le7Hg5JlTVA9negk74KH4fzEt7rUthf/PZ1DBb81PDMkQJJTSXtjyibFmwPQW0k48CoHVx7mbFT3EUTkLccNn1hocFoWtVIyX4Y58YdnVc4ccmBIW6e+qtALwWYnCAX43P4k8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755852389; c=relaxed/simple;
	bh=xiUcf6KQXL1mohvs6pLqMELi1Jr0lbQNCWaPe0Z3AFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iU/3WIi1N3zgniBw0qHHgQAasr2z5YVGSCbVBakmjEUtRyhhetd5k9elsUCjSkiQoY17qKirhk/zoOAmeoEx6A9aojrucWKZmdzKOWdo2WsQDipBQ+ybAcPPkskfzaLADX49qx85XwEbezvoW/p5MSIe2vqn+nh6Wy+m/HMv7HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X2q9+Zzr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X2q9+Zzr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so13936405e9.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755852385; x=1756457185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mKtzIyoCQlt7nDEX7AlctUdLR7BX98MJphMunffjSU4=;
        b=X2q9+ZzrFrnfR8u/Wp5LiNd9NcK/eLRnihwfJ8tnc35/ksIUVni2E01MoUSO2fXKtL
         J+iSnLX9QV6+0hvwX8hNYICj+uhUnkmXdbpKnmM3AVXD26E6bx0MezMgCIYe291pOF5n
         TgRQOfa7IYimAP+X10L7mShkO9Qu+vPUiOaHLweFwb6tjq2nhn5TvWJoa6l4eRWXWXQa
         sNSRSlItMSzuI6tymj9g1x28wwIpundE53wGEZuhkcKQD1AIGPArA3GO4vXrvXFmqOuI
         f9+cszGmKfYc0mdJw2ETKjYIzMeo83kn07YGxGRW6oCYaIH7y7I+hssLS2tAf3eCnk8r
         KAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755852385; x=1756457185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKtzIyoCQlt7nDEX7AlctUdLR7BX98MJphMunffjSU4=;
        b=fh0qrgXdJ8OTZM4VR0Man4evc5y0YLSEgxGLlfZ+f74Clp6TUBSqYHseBE5BNDEBYT
         Pyb+1PgQ3eIOfAX3QdVQ011oDmBN3CXghGaAkCA+3yyPLEX4bCmg6Qt49VQgo+7ttAW5
         wMho8E0nusDnjuA+SkfadrqZmq/5K0B2zCPNezBg7gwvDg0+291JyPO1sEXcAKOTleQ4
         U5xfjboJc+UL4X//GmXYpsCOwvd54WyXWEQNAmGRRXMiZfUg3GyyTensWm3KrojwHDHc
         V8thRWSWEQkKWlMwXgnCCDvOFdXWTvseRdPTVoFN4SvSgJQPelqiBKMyNFgpHrCQkuJT
         hjdw==
X-Forwarded-Encrypted: i=1; AJvYcCVKWZ1gAzlo+uB+ldWIfKFEPlXzzLRtbQX+HRYHxggIVVkj6Ke0FUQPIVbkNbK5S2vYdg+QdMMsc4WA+Lp4XWxX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/drUhHTdNuMS/Tslw32sIfZh4H8eyqCqGw+8UMUL770CuP9U
	DiAwj15lykeXHoRVqvkpanuqVYjWW1CrtGt2RDfd0zhrtqcGVnqWfk7YzYFHMQmQ3XY=
X-Gm-Gg: ASbGncvDoq7SUX5pKCv5mP8kVgb45VK+G2kayRdrNeFq0p0eTnDNfp9NtShE5UHqRrG
	28p2EDiCJhl9jcZ1ivoyoPW5DSWVpTl2PAC5bRwcOfrK002895j8HemkbOnT4XM+uvs5XKCHTfP
	4qKOWvhhbWb8JKJsffX4UdL6zaJ4O3WEuQPTKra+1+iIwuuKqxkd1AEoVnE0L6UHOSXQp00MJDE
	W1B70ViEB9obEavEYrdHBW1VWbDKmqjweK9TC9GHyg5cvgFKquWy0acM2aFjkIKG2W9/4J2x/nk
	X4PmBvN617lt5MiU49nLFdykSZqp/O7gtomnKyanh2Zh7l3u3QqXZu60cjFrTov3Yd/+Dnus5Sv
	UTuovQkfpa83DnvsxKvTjH04dIeq0NehN9JPNyO4KSxla
X-Google-Smtp-Source: AGHT+IEsclJmGdDVznTzN7OSbg0+qrHzDCwPUEaGD05vLXZ57+MhrejHOVS3jbp8VxpzYb4WstvJlA==
X-Received: by 2002:a05:6000:2f82:b0:3b8:f358:28b0 with SMTP id ffacd0b85a97d-3c5daff6b0cmr1574167f8f.25.1755852384692;
        Fri, 22 Aug 2025 01:46:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:63f:a353:7a5a:5beb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c5510a646asm3893162f8f.15.2025.08.22.01.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 01:46:24 -0700 (PDT)
Date: Fri, 22 Aug 2025 10:46:20 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <aKguXNGneBWqSMUe@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <aKWLZwYVPJBABhRI@linaro.org>
 <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>

On Fri, Aug 22, 2025 at 09:56:49AM +0530, Vikash Garodia wrote:
> On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
> >>>> +int iris_fw_init(struct iris_core *core)
> >>>> +{
> >>>> +	struct platform_device_info info;
> >>>> +	struct iommu_domain *iommu_dom;
> >>>> +	struct platform_device *pdev;
> >>>> +	struct device_node *np;
> >>>> +	int ret;
> >>>> +
> >>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> >>>> +	if (!np)
> >>>> +		return 0;
> >>> You need a dt-bindings change for this as well. This is documented only
> >>> for Venus.
> >> You are right, wanted to send device tree and binding support separately.
> >> But if required, will add with the series in the next version.
> >>
> > You can send device tree changes separately, but dt-binding changes
> > always need to come before the driver changes.
> 
> Do you mean to update the examples section[1] with the firmware subnode,
> something similar to venus schema[2] ?
> 

Sorry, I missed the fact that the "video-firmware" subnode is already
documented for iris as well through qcom,venus-common.yaml (which is
included for qcom,sm8550-iris). I don't think it's strictly required to
add every possibility to the examples of the schema, since we'll also
have the actual DTBs later to test this part of the schema.

I would recommend to extend the description of the "video-firmware" node
in qcom,venus-common.yaml a bit. You do use the reset functionality of
TrustZone, so the description there doesn't fit for your use case.

I think we will also have to figure out how to handle the old
"ChromeOS"/"non_tz" use case (that resets Iris directly with the
registers) vs the EL2 PAS use case (that resets Iris in TZ but still
handles IOMMU from Linux). Simply checking for the presence of the
"video-firmware" node is not enough, because that doesn't tell us if the
PAS support is present in TZ.

I have been experimenting with a similar patch that copies the "non_tz"
code paths from Venus into Iris. We need this to upstream the Iris DT
patch for X1E without regressing the community-contributed x1-el2.dtso,
which doesn't have functional PAS when running in EL2.

Perhaps we could check for __qcom_scm_is_call_available() with the new
QCOM_SCM_PIL_PAS_GET_RSCTABLE to choose between invoking reset via PAS
or directly with the registers. I don't have a device with the new
firmware to verify if that works.

I'll try to send out my patch soon, so you can better see the context.

Thanks,
Stephan

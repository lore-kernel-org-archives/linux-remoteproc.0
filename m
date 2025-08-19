Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0217227978B
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615919; cv=none; b=lTIXN5BqTa2L6O/gfnOT7s4mSHlqktowRq7X5hI4Eg8HBB0e7g2PAcz6bvkabqfUihSVdCoCbmKOnzFgbrKblIifpr3kgniJBmXBJV/3ln8wULQ9ooq3jSkD61tgzj6406AKUn4ghprTxEmV7yDTPsBFB1H1UShmJSgQ0rePQ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615919; c=relaxed/simple;
	bh=TIX+Ee8NEb/a3r6gXiqiPEEIYEocYif+rv1rShliL+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhQLFQ5qH+TTXNLgCizeSEA2LliO23GWqtUNequ+iTKblloFwl6GnZpDx17cokwG8POrsF3+7cmMHDQlzQgBofUQCG/Jh7nYRlKjFDMlxnOTSurugfSt7Fmv4sSOyMzpi0DDsVmsbybW41UXsOaYTbzRvMd4GSxC3ftYBrh1u90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=asyH9tUP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="asyH9tUP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7322da8so901322066b.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755615916; x=1756220716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HB1TK8MiMyt5D8q2I3xfM+5BRtgJsqXxPf3TbQkOCwU=;
        b=asyH9tUP5pbEhC5pkZ1VMfczlmotEScbp7LbSWcwf5yQAtbFQrnFI68DUtVDQLgnz0
         ZG9LJJCA6QI8MJNkcsbNYiDzPbAoMjbYbZtwoZd8JVAVGSx0OaRPsvDo5WT+kGnXn6d/
         mYItlYMeV9yA0jNgsuolekn58VXHf1g2HcU5VDNx6SUCyMNZ6M6/TmKuLW0pkDMZLDtF
         nGq3DKOrGiKi8vh9qV0pr+BCX3xhKge/CVK+kuD1jpE6BRqZlMZze4/YpDR99/jHkcvb
         FzQKz/HkgFK5m6y943oEORVt3pDx/rs+Gz10b9awAccUmKU6GOwnw3njkFQl/TwKnAXm
         i0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755615916; x=1756220716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HB1TK8MiMyt5D8q2I3xfM+5BRtgJsqXxPf3TbQkOCwU=;
        b=gPHcmT8ikgjiIA9NKR3w+LeHsSsR6Mfmq1HTQgx4dZNvMycY0y5mMgQ2mWDjsmW6m+
         nvnWjNBpPGfydFbifrsBSGW1b1o4Qg4nu9Cz7A0C3i4qLB/IEmTIQGEfeyTUxN+mjgpl
         Nb86oy7twQtmmRGEi5D9syfV1b0j+CkqJhdQ/Fr0PuzROLuQRL4HYZDQBSHFrDZFzj4c
         1KamViNOZu1euUSWSxmCZGZQm9zYRzjaqDarqr8PkJGBnnrfXfWWn3fNhHgcCsrVgfIS
         W+OuhMHxY2ureVlngc64qhO0FUJdc+xju8zsCPZ4hiIde9lXFEmJOHcmO4KIrM1FL7ni
         jBMg==
X-Forwarded-Encrypted: i=1; AJvYcCXUFgtDlQLYo1BChCIkpVF35RoYWQEywSoIu8vN4ea4DVvVnptayTrqMsuHtAfhrRLsfwy1BIkcvnE0K3dozMhc@vger.kernel.org
X-Gm-Message-State: AOJu0YySPEGw7a/8Vo5UouTG4vj3EZUNtQ8N3LfYa8GqekKEBCyaodLF
	yPccdGf5igkpB1/EIHhMVE9BtsyAgBWotcQ+QRWQvOJs8otwJt6BbemPFcEXa2AS9WI=
X-Gm-Gg: ASbGncu83LfC/yOMEdl57OPmSyy42a9GMhoPNH5eq7nZjlJ+KDYB4gl0XHMKwCqd3mH
	gG5e9l63aPMJm4LC+nZWawKObEWQXk9z8fMq+Ho/qoevwBaewlYI+76+DDfo11rRjnQGE0HxKnw
	an/yUaOPfTdEwvAJVog2owwK4OcmwTn4YvJvrCtrXXjAezBryKUlg2scMZHlXMKKnASf9QS84P3
	JuJNzEONBVWPh8AflKVlbOaJKtB5EwqvzpMPVq4WYwzBsBJcXMjinoEf++U53PlLfmRBqoAeqZy
	pf3/Wz1lZnfrnbJ8zI7wpGkjq22Oky+vd9U63U4Z20vih+fXJe5ZazSeWwvYIpy7yAAVO+1GFTF
	V5JUwtD6D5VawCjCmm4UDc/r+h9TI5ESbmps=
X-Google-Smtp-Source: AGHT+IGeywteA2t6LtBxKbFOHU2kX8UJSx3r5/9iIliKQyi/MAgw5IMMeRSE7Wt/KuB7uYx83gPwDg==
X-Received: by 2002:a17:907:2d09:b0:ae0:e18b:e92f with SMTP id a640c23a62f3a-afddcbb89b2mr285426266b.23.1755615916125;
        Tue, 19 Aug 2025 08:05:16 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:3ab9:939f:d84a:b5f0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd016bffsm1013201866b.103.2025.08.19.08.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 08:05:15 -0700 (PDT)
Date: Tue, 19 Aug 2025 17:05:13 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5: Avoid handling handover twice
Message-ID: <aKSSqXV5FOW27VJo@linaro.org>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
 <20250819-rproc-qcom-q6v5-fixes-v1-2-de92198f23c7@linaro.org>
 <r4kjhua4aakkgni2y4feigk5vvaz73ncetdvegic74lhuadosg@s2yzjlgb65lu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r4kjhua4aakkgni2y4feigk5vvaz73ncetdvegic74lhuadosg@s2yzjlgb65lu>

On Tue, Aug 19, 2025 at 02:41:55PM +0300, Dmitry Baryshkov wrote:
> On Tue, Aug 19, 2025 at 01:08:03PM +0200, Stephan Gerhold wrote:
> > A remoteproc could theoretically signal handover twice. This is unexpected
> 
> theoretically or practically?
> 

You could easily trigger handover again from a custom remoteproc
firmware by setting the handover state to 0 and then back to 1. However,
if you find a firmware version doing this, you might want to have a
serious conversation with the firmware developer. It makes no sense to
do that. :-)

In other words, on technical level it is practical. From a conceptual
point of view it is just theoretical.

In any case, if it happens, we shouldn't mess up reference counters in
my opinion (or risk dereferencing invalid pointers etc).

Thanks,
Stephan

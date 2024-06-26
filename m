Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C674214F102
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Jun 2024 19:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719429442; cv=none; b=IXaIUkFnyhd//ztsW2z+s0KYPH1VeQWQlxrF6hit0vK0UI1OnsTusySAgdYAssZLpRdfWGJi71rPiWFkWSEzhTRed6PphEUkg3XYIhebc2XQ/8vFUqErUGdmRb9eyhU8Pbsp3Qbnffv+DZLQLpuRycDs6KSwCkML+k9Kfs8jHt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719429442; c=relaxed/simple;
	bh=wZPdg1xi4qRyJlyk7LfqlaJ7fDLSDBw9fw7OGRNwYl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEzi+6A0J9EVsbTC3fZwMEcdMUnB/UFizkxTCDP0cVnWzWL3CVxDUpObhDNRRpNOsGQIMl2p5xOSLHLyolaiI67ziLHKhre4AksVRINkQwSFn8UrqCYqbokuHAxJYPEJ59KgTDisqG1y5ylh8hLR4QTWDDOVX8lg9aeT1pzLiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bdF6c38Q; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdF6c38Q"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52db11b1d31so1900377e87.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Jun 2024 12:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719429438; x=1720034238; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XI3lZHAHMpMacrGr7sZ7TIX64kTZg51b8AujnGsu14Q=;
        b=bdF6c38QBUdDjQCXET6Ae6XTz9eVDupe6JNWAxfkoLAy9v6hr0ZSWlAjvaA52Bi987
         eA86ed5YG9ThpMRAaVIx67Pq1oKjVjFhaYXm18G4A5ipD0oEqlvgW+LwhC4DaXF3SAkB
         E/pxdVjtDGJUMcRbBBp0xutTR/hgBU9udoeWZxLHkgk/NEIEQ6QxRpjmxyp+68G+KU6M
         c/u6oTK61jxogveuRB4lhNVEI0WEvWULNBAJIvkjxVfiervIQlzdkWT0UrChocMIzyCd
         XhgYZMghHlrFJEqLXYRv7tAbkO8DoMAMvjxzcZH68j7kSvIL00R5G/CsX02/pAvsO3ai
         ZbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719429438; x=1720034238;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XI3lZHAHMpMacrGr7sZ7TIX64kTZg51b8AujnGsu14Q=;
        b=TsBuQlMj3P6K0bKgM8ZExK13CSLL6TDWtuH7tCOH4LNhdWb5DXh+5RPKZiE36HZ+t4
         UjT5Gsz+WurzGziaXRrrMguny+fLmcWnH3K3CUy1hRNCjcRkIQOLDH/A/peB339tN/Bm
         Osyyu/5R49eCqz+8dNRKb8V5dxdf6b7zbuxl9WKThg+QCYDHXUosYMrybJO0cFqW3O/J
         03Up/0sBooELKDdHdoMP75nIF5RY6Cnqi6poka9zSRISU1IQ+2wWy4QmQxERrvD0b9dl
         GEYkHDt9UlTQJ6CLY+FcoQVV8iQZ0grfvqUJnnD/H3/U0A2BNTD6A8xDP/EnoZnbmcU8
         Afxw==
X-Forwarded-Encrypted: i=1; AJvYcCW80zWACtfWnbaqMc5gr+CogBxO4uAwnzVCQGIZ45CRMkIw5oc5h+Q5/aBwpVT/bOxeTXAMx4wp1BR0d5pISEWLm1uCCHKHjvuMhy8V+rIiDA==
X-Gm-Message-State: AOJu0YwYNI5h9TWM+mPlnngAKWlc5BmV03l3wgiEg9JtA0e6jpCVsUdD
	mGfz1wFbWJgcoYntTLQ4f8Fdxg1gRkoT7NRjumFOqcmcQwbDZSV+3QuHc68VWM8=
X-Google-Smtp-Source: AGHT+IHV/jft8RtNZmUB7mEGILVCEPrignxw3W0VzQYDTf1gbiJqRpR7V0F3dldHCqlThMgWvlblJQ==
X-Received: by 2002:a05:6512:60b:b0:52c:c5c4:43d2 with SMTP id 2adb3069b0e04-52cdf8209b9mr8426942e87.47.1719429437950;
        Wed, 26 Jun 2024 12:17:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce663d1d6sm1018227e87.157.2024.06.26.12.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 12:17:17 -0700 (PDT)
Date: Wed, 26 Jun 2024 22:17:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram P <quic_gokulsri@quicinc.com>
Cc: sboyd@kernel.org, andersson@kernel.org, bjorn.andersson@linaro.org, 
	david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, 
	robh@kernel.org, sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 1/8] remoteproc: qcom: Add PRNG proxy clock
Message-ID: <ga5kczcyn3dqoky4525c74rr7dct5uizun2smvyx3p3u6z6vtm@5vshoozpttod>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-2-quic_gokulsri@quicinc.com>
 <chi3pzh5ss3mivnhs3qeoen5hsecfcgzaj6qnrgxantvinrri2@bxsbmpufuqpe>
 <73cb638e-4982-49a2-ba79-0e78402b59ad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73cb638e-4982-49a2-ba79-0e78402b59ad@quicinc.com>

On Tue, Jun 25, 2024 at 11:03:30AM GMT, Gokul Sriram P wrote:
> 
> On 6/22/2024 2:38 AM, Dmitry Baryshkov wrote:
> > On Fri, Jun 21, 2024 at 05:16:52PM GMT, Gokul Sriram Palanisamy wrote:
> > > PRNG clock is needed by the secure PIL, support for the same
> > > is added in subsequent patches.
> > Which 'same'?
> > What is 'secure PIL'?
>   will elaborate in the updated version.
>   To answer your question, secure PIL is signed PIL image which only
> TrustZone can authenticate and load.

Fine. So, the current driver can not load WCSS firmware on IPQ8074, is
that correct? Or was there some kind of firmware interface change? The
driver was added in 2018, so I can only hope that at that point it
worked. Could you please explain, what happened?

> > > Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
> > > Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> > > Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> > > ---
> > >   drivers/remoteproc/qcom_q6v5_wcss.c | 65 +++++++++++++++++++++--------
> > >   1 file changed, 47 insertions(+), 18 deletions(-)


-- 
With best wishes
Dmitry

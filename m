Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79FB216454
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653722; cv=none; b=eo7eaP3Z5QnOhLFV6BH10ePhfhNM8Kn/c7dnVZua5DRV2q8Krkb2EgYglVn9np8w6vKj7sJ2DQAz5rnOSJ0Wa4FtYjLlXBryce7ODVwVz+XMVOETsoXs8lm+0yO0yXAxBHUkIre2ZkraNABkPW538Cr82n3DdugUo26vFNJdH80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653722; c=relaxed/simple;
	bh=EkTcLG59Q4Wh5ZIKc7+7wJm7NcDhqPA7VwUd8kbAgfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdwHCjOMS4YD62x7UGqLIi0dMGEundt/t5e9kaHWmzy8aEiVyxcOPYRNFLYjIRPhNJcfR42CiJdCZGFkNKTDVV8Ecy74OVBdwt7ZWc3Buf+oQCfRdfKdimeZ5G7zSdpKqscJO5fsEYaL45y6Jx4rUCULNOtcgVZgeT8C0jVVL+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DB2JkzZd; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DB2JkzZd"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fad100dd9eso21482751fa.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728653719; x=1729258519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rG8zqMbqmQKD8FKQihMwNmSsjclOXl8It6tFFfw1Ars=;
        b=DB2JkzZdoJwYGNR7bhYjbfgwl5Jzg9gVz7M9558B3VVCeita6va1Pv8cJtmS9UnELC
         B35RbJzg1s7mnZBdhoBqBgnD378t5AcWj9hOB265yW2Z8pt6kRwh43BZo2/c4eGOYfHF
         XVUa5WvsK39TQTylgq+rtatOymnL1fb5cXTUjvlbyxS0x/pPf3oaR0L477gGMVHbr0+o
         4kQ3vA2q84WhnusFV81hgaeEQdgZoImI1UKYLNY64xtidoo1iY+RKvd+FfNGqPudEvZ6
         LBYRgoWBfjG+89giTjcT5BZCFwRuSXe6oh5v7Ila9ToUw4CeqQd7Si/U1CSdpRf/Wf5W
         xuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728653719; x=1729258519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG8zqMbqmQKD8FKQihMwNmSsjclOXl8It6tFFfw1Ars=;
        b=acFx7eZae42osZeNSmcOyYFpa1gNwFxxUpByWhABbSJyjZHB+4lIYyrspM2aFnva5p
         FhI2MqibA0XIwB6caLKfotE223+ileptzhUGCTt06MwM6CGUuhQOeFZ5NKqGY8nOYdki
         /2I2LaGfVCRvY4jIA8drTdD8ahxiJnH6gzlcT9TjA07spyqwcXViUcyHLxezAmfWukBA
         QjGIlnNCv5fRRBc714VMJq+u+OU6vAvlrjy2CUtEul2GijK19zTXEYUOUmOvmcevKOIB
         9lq5KZOwdZR/ZVXjn4oFYSdxQ847Wsni7SblHoa8J+Cpd55Gj7n8IgyHYc0FLE30/uXA
         Yu7w==
X-Forwarded-Encrypted: i=1; AJvYcCVI+DEFaLARM03BGeZu/Ay40TreuE4OmtglVEiCawpMzlYIWhsK85gjYbPhVs6P1rj4YYbllMoTNP77Q1kYxQjN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2fCYdP0uAhBHm85awcB+D911KWT4SYaXpVb2X2r1RPE1gBOWW
	q5v42A3T+1vcLyu9GlhUX1lSMVP6g0xsDvAkYxSV8GG0QzcRlp4K0kxcPt/HTYI=
X-Google-Smtp-Source: AGHT+IHQpz/6GvIvHaMf1u3ffEGjPUPDO5ESVhqpSrZKzBqsenT6o2iZkgVDJ/mHkWrrUbIg88qi+Q==
X-Received: by 2002:a05:6512:3e2a:b0:52f:1ef:bafe with SMTP id 2adb3069b0e04-539da3d0e40mr1403776e87.22.1728653718909;
        Fri, 11 Oct 2024 06:35:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e3190932sm69337e87.174.2024.10.11.06.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:35:17 -0700 (PDT)
Date: Fri, 11 Oct 2024 16:35:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 06/10] remoteproc: qcom_q6v5_mss: Simplify with
 dev_err_probe()
Message-ID: <ihown6evv2vnlyaiffjuetpw5p3mzcgsg3cuy2npnk3s3atjm4@3lsk2s5kz2yd>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
 <20241011-remote-proc-dev-err-probe-v1-6-5abb4fc61eca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-6-5abb4fc61eca@linaro.org>

On Fri, Oct 11, 2024 at 03:09:14PM +0200, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make error and defer code handling simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

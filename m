Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384F311C04
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695252; cv=none; b=XC6KWE4xyLSwngO5gzXA1u61UqmE+Ni78OfPD/1kVtHU/lTdXlIFFo03dbUPqLEqlBZYqcJFa1CbFqWAx+6lN3A1Hti97qUPvQzFgLgQYp24fHrDl8fGQX74nfTBCc9jJ01GGdN85U9cVun/x3yUVScbg4QhA88wGqb9XavxcdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695252; c=relaxed/simple;
	bh=X/HnEbOt1kxd7Jy+231ddpEnGbEAx2HX1Aw7LGzcYH0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3o4VvbNMBa1M+bnK9ZjHuExsEiuYDXaoUh+JF68wrP0JR91T5kyZqNUWLq1m9EhGPHdwJiNISk9pBB4UlWaazzSPyAGHWEKllyAz2wNDcUUp1kOxaxQ/44UunTkqJn061CVhUtk0PRaYjezqa51xRWfUOFSGYhQI6aD8onorhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z90v5UK3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z90v5UK3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9e418ba08so3539475f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 06:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755695249; x=1756300049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5OQS/emDfXIYrpr8riBnRkgKKKbGxRuLEAKZuS2I3s=;
        b=Z90v5UK36HBuw1VTYpild7A/Oal5ra7mugHxqlXyXDnupvc3EHhKCRNq3sCyidFxDT
         ogxLbUylBaarO1W75CerzBKVScgEnajMssq1+cjSCM4YbilAMVdE9Oi9y1Cx8f+0qL6N
         GhRD3/6pg1lJcMEx5qbYA98txoPnUcBcB987yKZDIipPm18GIdJeve1zXe862h4Xyhfn
         FHqm9Omo5+w9iBSutiCBKm1wrDi6XYL2/BqQkga99X7ZSFibitJfTQH5OeIdymQ1TUi7
         DSu+JRuOR+3h5KLzUlNzZ1m1kbyW3YDI1CG6WdeI7Mzm54pUgA4rXI6FtOenYSvU2vGt
         vfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695249; x=1756300049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5OQS/emDfXIYrpr8riBnRkgKKKbGxRuLEAKZuS2I3s=;
        b=XCmSE/zMTK4rrIp50zjlpTUlitnkyRYY+WuSwMOKuw0upP0RL9H71WhW4/WjK9PMGz
         WoE7TortE8WmdZ34QDbGQzaWJGWrneaD52apjtyvrjRSXQYWn7cuG7M0HCN5ZgcRhdp2
         ska0UpTbEb1vZmaF/vhCN/QsnnABj92qie5B3XJSkUbWiuaEVKvVAIaqVNT3yxvvw/xR
         pQprupMfQkrMcrsji0LscnUTR1/B7DmM+bLUONIJsPsw7UTw0m9LH8/3dwFzjqIS12aE
         l+F7wlk5OIKnZzK155lBBM1KP22EI6OrRGUE/Mr15BMjanumSb2ld7iqZSAtWlVpxJAu
         n44Q==
X-Forwarded-Encrypted: i=1; AJvYcCVz+c3o1fW9JVU3F1WM55Gb6sKIlrUZRIH6kIUWqIlKXs5alu9n2CgXhDtVM1ygclD714dMG12Qh5x+4tye8ubA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw0rrakXlL68QaepPhZgrm2dtb26qz+88j8rT/W5H1UgNrlX1V
	18MY52zKnsmsUQpS/C0EF0JVd8ZKdet/LTM2FDcweikoq6Ib9ljFc1TUv9/ycci3jdA=
X-Gm-Gg: ASbGncuPuVIor4tVF+k8EKlNM0uC6FJbWXDaMiDrwrflsv4FYg3sZfs3wqMSeDuEJwq
	n9+pHcuo53cVONpxYuH3XceEM0SLq9J12Hx34PDPTGj2+NnDAmduU5hV1XMX4EuiJVGBBffwatR
	T5OK2NS+GCNhOGK/syjNeyYi3kI8wBNzrNiXGhjP3b5HCgJC6/QFQZl2Ytpl0pSLHvYb1hxAt3h
	VoHoL5ZQmQhUdQjmzPUriu0unVVHfXZJhLi1KDszSrWnXimp/fx2QG26UOefNXlQnZBDoiDr2DS
	GqPMufOcqXkQGpEXISop3tW1Ky5EyI5xfMHwe4taMMXvzTt2/hVCj9z9IsQus5kCHP7+xok2Ie+
	Ba7aW6oFxbzZKFN9yvplQ2b3nLxy4lc9jeF/76fqT2hpJqA==
X-Google-Smtp-Source: AGHT+IG8orkF5yWVfvMT//81luXMNidmsJjDH/qnlbhHQmtj+2joW4b+rCnpdIDDxhcI41r837UxXg==
X-Received: by 2002:a05:6000:420b:b0:3b7:8410:22b5 with SMTP id ffacd0b85a97d-3c32bf5cc96mr2025869f8f.13.1755695248723;
        Wed, 20 Aug 2025 06:07:28 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:d9eb:6295:cf25:b839])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074879f5fsm7662631f8f.4.2025.08.20.06.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 06:07:28 -0700 (PDT)
Date: Wed, 20 Aug 2025 15:07:24 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 09/11] remoteproc: pas: Extend parse_fw callback to
 parse resource table
Message-ID: <aKXIjAGZVnMy4EYb@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-10-mukesh.ojha@oss.qualcomm.com>
 <aKWI-izL5BooL61p@linaro.org>
 <20250820111448.tjaz2wld2nxg52aq@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820111448.tjaz2wld2nxg52aq@hu-mojha-hyd.qualcomm.com>

On Wed, Aug 20, 2025 at 04:44:48PM +0530, Mukesh Ojha wrote:
> On Wed, Aug 20, 2025 at 10:36:10AM +0200, Stephan Gerhold wrote:
> > On Tue, Aug 19, 2025 at 10:24:44PM +0530, Mukesh Ojha wrote:
> [...]
> > > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > > index ea7034c4b996..8456cca3f3e0 100644
> > > --- a/drivers/soc/qcom/mdt_loader.c
> > > +++ b/drivers/soc/qcom/mdt_loader.c
> > > @@ -22,7 +22,6 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/soc/qcom/mdt_loader.h>
> > >  
> > > -#define MAX_RSCTABLE_SIZE	SZ_16K;
> > 
> > I'm confused why there is a semicolon here suddenly. Did you edit this
> > patch by hand?
> > 
> > Applying: remoteproc: pas: Extend parse_fw callback to parse resource table
> > Patch failed at 0009 remoteproc: pas: Extend parse_fw callback to parse resource table
> > error: patch failed: drivers/soc/qcom/mdt_loader.c:22
> > error: drivers/soc/qcom/mdt_loader.c: patch does not apply
> 
> Yes, I did this edit just before sending when checkpatch caught this.
> Will avoid this in future.
> 

Please don't edit patches manually, fix the commit instead. ;)

> > 
> > >  #define RSC_TABLE_HASH_BITS	     5  // 32 buckets
> > >  
> > >  DEFINE_HASHTABLE(qcom_pas_rsc_table_map, RSC_TABLE_HASH_BITS);
> > > diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> > > index 62f239f64dfb..92ad862e733e 100644
> > > --- a/include/linux/soc/qcom/mdt_loader.h
> > > +++ b/include/linux/soc/qcom/mdt_loader.h
> > > @@ -8,6 +8,8 @@
> > >  #define QCOM_MDT_TYPE_HASH	(2 << 24)
> > >  #define QCOM_MDT_RELOCATABLE	BIT(27)
> > >  
> > > +#define MAX_RSCTABLE_SIZE	SZ_16K
> > > +
> > >  struct device;
> > >  struct firmware;
> > >  struct qcom_scm_pas_ctx;
> > 
> > You added this define yourself in PATCH 08/11, so just add it in the
> > right place directly. Make sure you scroll through your patch set before
> > sending to make sure all changes are in the right commit. :-)
> 
> I did this intentionally, because there is outside user of this macro 
> with this patch.
> 

I don't think putting it in the header without an immediate user is a
problem, as long as a user appears somewhere in the same series.

Right now this patch touches multiple subsystems at once (qcom soc and
remoteproc), which should be avoided when possible.

Thanks,
Stpehan

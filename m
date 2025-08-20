Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2451DB377
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755708825; cv=none; b=Hf6zIBGap7I0qkLHrnkPGIS8UBwsbIhIcpfI6mZ3nQQwjevbL3l6y8hSQLM5t9M4i8ImMjyTuAvsLfal/0yz2nulsgAROHJAhACrIzgKk4nvxEKqs/EspzaAdlr4iLhJxDbkCVHhALjbXrBYf9oBldCp65H3f6HlvbFWlFBr2CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755708825; c=relaxed/simple;
	bh=YFh9tQlkjzT5yWM+TmV6WOeSwu9NitbNMXsAdBpXl6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpU3xQifIZ0GjFh1RbG5uJnC8xF5kDDCj59RSdYNDhyufDpJNy24R2327Cf4Apn6+SQnpb0MNKJSktUxS3heBRe84qMAj18fPbaKlrKnxfk71lAjufyKUZd0P2a61qoGgZuZoDWnQdqN6if6a0HvrAIol3r9KdVXzLm7E9ipMHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BRQKINB6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BRQKINB6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so119368f8f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 09:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755708822; x=1756313622; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WpCvOUEy9gt+e1INXVvX+QS4u6BMKssFhZFYzWXcaY4=;
        b=BRQKINB6EYU/nvEofIbXMeVTiAR3hU2Qld1wLO1hHns/hq2ZrF8FDGoXgSg9j8HzDM
         Kh8pmP8NT34Sa3k8O9iyOVN9RRwjwwNR4aJKt7aK/oqcwHNdMpDtC1KUzOJ73rjMnH1P
         cvV5K2zdw6wOEsbnCPqlPm18N4S1mWvCEEn+lRbhM7YKS515xKmkrJrzry5KFGl3Af5X
         T12UcOZi9pGCcIVx0DqeNc4yGkmu3hlDDrjNRCTb4qPKyMSZmpgDre6Oni8E4qXuVCYt
         hazFXzj79iWiGI/lu46k7Cj++DZUsodiiramULzVjCCNP9ABzdGIfuh3OuJQMyPkEB4K
         nq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755708822; x=1756313622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpCvOUEy9gt+e1INXVvX+QS4u6BMKssFhZFYzWXcaY4=;
        b=YM2WnPjTTqgKJgCC7Fw6D/7Y+8+HysZfNJ3cvMMxFCwthg7uW2fQou1L4+sFaQV7eU
         gEB2IemtYs40vVUXXVfzBLasX5z2A5wDyoZAvdqSMU0mS8+tTr2aos7Q8LA4sLSrvaus
         J7DNi+1bsgduvtbl0VobJh2mCfBAwmusaj9dIp0EfB3sr6tcH9iYuzNCyRsQidwsZL0k
         VfNfppCOhZMc3n19UoiGUzSXWq2N+AZtiro4uhUsWyJSd9Vim5mOLx4LkRiXlLYq84AQ
         FSMZVaACLN2qsZTJXaBZ6EbW1vV6HLSOF9dfL2dvHLPE6sBrS1vJunuIe4Nsvj7ctgEl
         5tow==
X-Forwarded-Encrypted: i=1; AJvYcCWmoyGhCx1JauT+YWbohjoc1h2jydOWkD4Lt0bjBuI7e4CBxdn1DP+jNNuOF/aZ13aMblABSMoK0+8vR7Df79Ww@vger.kernel.org
X-Gm-Message-State: AOJu0YyCZgWlaVRzCXY4cpnq6UG+kRawlXOJignm63iXOAv+mdaVhDDl
	1Y348b8MJtP26lnkqH3KaQd/LgpnmYIUryz2T2HokyHg+1BZJuzlSfZMXhIC9RahMj0=
X-Gm-Gg: ASbGnct0ePDPW8L2gb/Czt70WehqNg/l93ZE0p6SxsXioV8rmuf8Zi/oRc0ibg6yay5
	jxInMisTZGz1xZKNZBPAWJmTkYyzQOe82cg6kyAAb+5ntQGbtAOL7dXChXaOLulgLkulk5eqXD2
	S228wv+zLhmrcMZj1SvDclA77AKJRFM8e28yInZowV8UV9dmknnlJ7STv9jLA13UYae7lfEJz72
	WGGGtKIz3mYW70aHYLsb8HABpRLUIvZT4qmSz3wZ/yOHUhCM/rx2wJTmREr/l76wz8hUQaDQ3Oz
	T2/OE+h4mthDBXn65ePySvbrSi9G8f0nxebGHs9S+Y+V7kSoT8qydT3T6WAvEqgWJyPmN7d+aFj
	uE1FfTzNJyjbn9689HyJCNBc/YBgb+g2LsSM=
X-Google-Smtp-Source: AGHT+IGB0p+aULag9mfdU8eRn3hjRaFkMxyv9kzuYWAqcbOyx1VfevBG2Noz2dFjBb5RNTesRx0DXg==
X-Received: by 2002:a05:6000:4308:b0:3b7:994b:8438 with SMTP id ffacd0b85a97d-3c32e709bd2mr2518257f8f.46.1755708822180;
        Wed, 20 Aug 2025 09:53:42 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:d9eb:6295:cf25:b839])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788b39sm8447524f8f.47.2025.08.20.09.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:53:41 -0700 (PDT)
Date: Wed, 20 Aug 2025 18:53:36 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <aKX9kO5eHUp40oRj@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
 <aKWDXySSt57tXHVP@linaro.org>
 <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
 <20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com>

On Wed, Aug 20, 2025 at 10:02:50PM +0530, Mukesh Ojha wrote:
> On Wed, Aug 20, 2025 at 08:48:22PM +0530, Mukesh Ojha wrote:
> > On Wed, Aug 20, 2025 at 10:12:15AM +0200, Stephan Gerhold wrote:
> > > On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> > > > The resource table data structure has traditionally been associated with
> > > > the remoteproc framework, where the resource table is included as a
> > > > section within the remote processor firmware binary. However, it is also
> > > > possible to obtain the resource table through other means—such as from a
> > > > reserved memory region populated by the boot firmware, statically
> > > > maintained driver data, or via a secure SMC call—when it is not embedded
> > > > in the firmware.
> > > > 
> > > > There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> > > > etc.) in the upstream kernel that do not use the remoteproc framework to
> > > > manage their lifecycle for various reasons.
> > > > 
> > > > When Linux is running at EL2, similar to the Qualcomm PAS driver
> > > > (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> > > > also want to use the resource table SMC call to retrieve and map
> > > > resources before they are used by the remote processor.
> > > > 
> > > 
> > > All the examples you give here (Venus/Iris, GPU) have some sort of EL2
> > > support already for older platforms:
> > 
> > Example was taken from perspective of remote processor life-cycle management.
> > You are right they have worked before in non-secure way for Chrome.
> > 
> > > 
> > >  - For GPU, we just skip loading the ZAP shader and access the protected
> > >    registers directly. I would expect the ZAP shader does effectively
> > >    the same, perhaps with some additional handling for secure mode. Is
> > >    this even a real remote processor that has a separate IOMMU domain?
> > > 
> > 
> > I don't think it is the case and think the same that they can skip
> > loading and Hence, I have not yet added support for it.
> > 
> > Will check internally before doing anything on GPU.
> > 
> > >  - For Venus/Iris, there is code upstream similar to your PATCH 11/11
> > >    that maps the firmware with the IOMMU (but invokes reset directly
> > >    using the registers, without using PAS). There is no resource table
> > >    used for that either, so at least all Venus/Iris versions so far
> > >    apparently had no need for any mappings aside from the firmware
> > >    binary.
> > 
> > You are absolutely right
> > 
> > > 
> > > I understand that you want to continue using PAS for these, but I'm a
> > > bit confused what kind of mappings we would expect to have in the
> > > resource table for video and GPU. Could you give an example?
> > 
> > We have some debug hw tracing available for video for lemans, which is
> > optional However, I believe infra is good to have incase we need some
> > required resources to be map for Video to work for a SoC.
> > 
> > > 
> > > Thanks,
> > > Stephan
> > 
> > -- 
> > -Mukesh Ojha
> 
> Since I am not subscribed to any of the mailing lists to which this
> series was sent, I am not receiving emails from the list. As a result,
> your recent messages did not reach my inbox. Additionally, it seems your
> reply inadvertently removed me from the To-list.
> 
> 
> https://lore.kernel.org/lkml/aKXqSU-487b6Je2B@linaro.org/
> 
> https://lore.kernel.org/lkml/aKXQAoXZyR6SRPAA@linaro.org/
> 

Indeed, but I don't think this is my fault: You have a strange
"Mail-Followup-To:" list in the email header of your reply [1] and my
email client honors it when I press "group reply". Your email client or
server seems to produce this header without including you in the follow
up list, as if you don't want to receive any replies. :-)

I fixed it up manually this time, but perhaps you should look into the
source of this weird header in your replies, I'm probably not the only
person using mutt and just hitting "group reply" all the time ...

Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com/raw

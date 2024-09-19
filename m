Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BC119B59D;
	Thu, 19 Sep 2024 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726757876; cv=none; b=E1xSUDPM+yjRlGOYLfD8TxaQv6G9QIrjm2riPUL057M3wEDA81rTeKZGudTGlPeNaK0LvlyeSS9WacVm/jCys38xnvpc+3nPx3OkN1ep6TTIeoLg+yTayjgocWho5hRybpxsy14s28C8cmViRba8rpt4DGMpv/wTzRDmCHq7d60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726757876; c=relaxed/simple;
	bh=W3Ku+a7f0Dz6ceI3TMqFraG7tkSnVcQJQJyuQe1NDQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KB41DyQBQ1n5v6it6j7I85E+Lyb0tKE6Ot5k/Pa6CowS3oSCNjPsi7NpgONT/9/lXby7SnsNXBuf6VCq+lyJ5CNgBPDfc1wociU1mt9EUxXjp9bKPUqky6TSiIWD4AUYXnGu5UbIpQksO/QAs/gBoDcHPlYgmU0iL426z4ljcyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57155FEC;
	Thu, 19 Sep 2024 07:58:23 -0700 (PDT)
Received: from e130802.arm.com (e130802.arm.com [10.1.31.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 508033F71A;
	Thu, 19 Sep 2024 07:57:50 -0700 (PDT)
Date: Thu, 19 Sep 2024 15:57:41 +0100
From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mathieu.poirier@linaro.org, Adam.Johnston@arm.com,
	Hugues.KambaMpiana@arm.com, Drew.Reed@arm.com, andersson@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, liviu.dudau@arm.com,
	lpieralisi@kernel.org, robh@kernel.org, sudeep.holla@arm.com,
	robin.murphy@arm.com
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: sse710: Add the External
 Systems remote processors
Message-ID: <20240919145741.GA7940@e130802.arm.com>
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
 <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
 <gzlncpyzwm7x4jcxtdrthrlv2dofk7u3oxn4taadwog5tt37wo@ot6s6kwukd4k>
 <20240919093517.GA43740@e130802.arm.com>
 <222b3b11-151a-4ad0-91ea-54ae8f280bcb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <222b3b11-151a-4ad0-91ea-54ae8f280bcb@kernel.org>

Hi Krzysztof,

> >>> +  '#extsys-id':
> >>
> >> '#' is not correct for sure, that's not a cell specifier.
> >>
> >> But anyway, we do not accept in general instance IDs.
> > 
> > I'm happy to replace the instance ID with  another solution.
> > In our case the remoteproc instance does not have a base address
> > to use. So, we can't put remoteproc@address
> > 
> > What do you recommend in this case please ?
> 
> Waiting one month to respond is a great way to drop all context from my
> memory. The emails are not even available for me - gone from inbox.
> 
> Bus addressing could note it. Or you have different devices, so
> different compatibles. Tricky to say, because you did not describe the
> hardware really and it's one month later...
> 

Sorry for waiting. I was in holidays.

I'll add more documentation about the external system for more clarity [1].

Basically, Linux runs on the Cortex-A35. The External system is a
Cortex-M core. The Cortex-A35 can not access the memory of the Cortex-M.
It can only control Cortex-M core using the reset control and status registers mapped
in the memory space of the Cortex-A35.

I'll make sure this explanation is added to the binding and commit log for
more clarity.

Thanks for the suggestion regarding supporting multiple instances of the
External system. I will send a new version shortly addressing all comments.

[1]: paragraph 2.3, https://developer.arm.com/documentation/dai0550/D/?lang=en

Kind regards
Abdellatif

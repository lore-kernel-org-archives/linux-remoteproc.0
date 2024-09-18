Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CA11537B5;
	Wed, 18 Sep 2024 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726674013; cv=none; b=MkIflDiI8Z1Y1FvqXTa3AYrLBRGQkhTLa7U7AqN2C8pKmZfJunrxeSZwmyju/ixpWJICfaxmsIjwBDb34KpVweMe7k6c+Y96WiNJaiNM+v20hAVbnMUwFb8bOn6wadKCxstL4SN9Bb0YUMguoli1H/ctiKErLxpNSnhPRPwLA4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726674013; c=relaxed/simple;
	bh=dv3q94lYKAP/yqlWr0IpNQkANLsEHeyFezLEWtxEDB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMZXFTZ7i7+miSbKewV8fTPVR6oZ7CnKPwS6qPNSkrUUdVQLYYzkcm64N38iCOwVfr9mRUqhdfgHe1u7BF8f6Iqhh6cTBEa8MqwPXCAJMXffiAjX/mLHhp4cMuGipDuFQfS7YBAt3r2qzfM0Qj03m2bG778zmEX4yTFSzxrLGOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E965BFEC;
	Wed, 18 Sep 2024 08:40:39 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.1.25.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A8773F66E;
	Wed, 18 Sep 2024 08:40:09 -0700 (PDT)
Date: Wed, 18 Sep 2024 16:40:00 +0100
From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
To: mathieu.poirier@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 5/5] remoteproc: arm64: corstone1000: Add the External
 Systems driver
Message-ID: <20240918154000.GA55399@e130802.arm.com>
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
 <20240822170951.339492-6-abdellatif.elkhlifi@arm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822170951.339492-6-abdellatif.elkhlifi@arm.com>

Hi Mathieu,

> Introduce remoteproc support for Corstone-1000 external systems
> 
> The Corstone-1000 IoT Reference Design Platform supports up to two
> external systems processors. These processors can be switched on or off
> using their reset registers.
> 
> For more details, please see the SSE-710 External System Remote
> Processor binding [1] and the SSE-710 Host Base System Control binding [2].
> 
> The reset registers are MMIO mapped registers accessed using regmap.
> 
> [1]: Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> [2]: Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml
> 
> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> ---
>  drivers/remoteproc/Kconfig              |  14 +
>  drivers/remoteproc/Makefile             |   1 +
>  drivers/remoteproc/corstone1000_rproc.c | 350 ++++++++++++++++++++++++
>  3 files changed, 365 insertions(+)

A gentle reminder about reviewing the driver please.

I'll be addressing the comments made for the bindings.

Thank you in advance.

Cheers,
Abdellatif

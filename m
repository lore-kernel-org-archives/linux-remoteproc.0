Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41DA199955;
	Thu, 19 Sep 2024 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726738533; cv=none; b=lokPyl6ppNFWpYccO2YgWEhpX30b1yn+JllctObloAN46gLwETyIe58A2lqsrjjBqH9rv8wDSgwmUMztEq5lNsaSdvdR6hSxcBY87gdWyF46Yc39B0EdlKDt0HlkZqZZxZP/v+/J1ArbAp/XIYPnt/VgwtccXpsaOhYIH64wArI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726738533; c=relaxed/simple;
	bh=f9kW1QzwFRVgp6SiIupD0howGzh02chdoaL2Lk4uAnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Do+EBGG0r3oiaTXwH68YgPu7oAvVshyzkCCgCbnFg/0sMlwG0mh2GWMcJAfdId4DPIpltfSB0EYWxdJcfOL1cQwSuBrzSYc3ySvh9CLgE3612NYf+/8R/9pOIW5mokywNmozWb4oByZyOSuIeQ3hJD+zOBH/k0YFUzjtLkLVV78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D8451007;
	Thu, 19 Sep 2024 02:35:59 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.51.133])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D6513F71A;
	Thu, 19 Sep 2024 02:35:26 -0700 (PDT)
Date: Thu, 19 Sep 2024 10:35:17 +0100
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
Message-ID: <20240919093517.GA43740@e130802.arm.com>
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
 <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
 <gzlncpyzwm7x4jcxtdrthrlv2dofk7u3oxn4taadwog5tt37wo@ot6s6kwukd4k>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gzlncpyzwm7x4jcxtdrthrlv2dofk7u3oxn4taadwog5tt37wo@ot6s6kwukd4k>

Hi Krzysztof,

> > Add devicetree binding schema for the External Systems remote processors
> > 
> > The External Systems remote processors are provided on the Corstone-1000
> > IoT Reference Design Platform via the SSE-710 subsystem.
> > 
> > For more details about the External Systems, please see Corstone SSE-710
> > subsystem features [1].
> > 
> 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.
> 
> > [1]: https://developer.arm.com/documentation/102360/0000/Overview-of-Corstone-1000/Corstone-SSE-710-subsystem-features
> > 
> > Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> > ---
> >  .../remoteproc/arm,sse710-extsys.yaml         | 90 +++++++++++++++++++
> >  1 file changed, 90 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> > new file mode 100644
> > index 000000000000..827ba8d962f1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> > @@ -0,0 +1,90 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/remoteproc/arm,sse710-extsys.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SSE-710 External System Remote Processor
> > +
> > +maintainers:
> > +  - Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> > +  - Hugues Kamba Mpiana <hugues.kambampiana@arm.com>
> > +
> > +description: |
> 
> dt-preserve-formatting

Do you mean I should remove the '|' please ? (I didn't find examples of use of
dt-preserve-formatting in Documentation/devicetree/bindings/)

> 
> > +  SSE-710 is an heterogeneous subsystem supporting up to two remote
> > +  processors aka the External Systems.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - arm,sse710-extsys
> > +
> > +  firmware-name:
> > +    description:
> > +      The default name of the firmware to load to the remote processor.
> > +
> > +  '#extsys-id':
> 
> '#' is not correct for sure, that's not a cell specifier.
> 
> But anyway, we do not accept in general instance IDs.

I'm happy to replace the instance ID with  another solution.
In our case the remoteproc instance does not have a base address
to use. So, we can't put remoteproc@address

What do you recommend in this case please ?

Kind regards,
Abdellatif

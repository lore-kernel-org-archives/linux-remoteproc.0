Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19496482CD;
	Fri, 20 Sep 2024 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726842014; cv=none; b=Fw5R/6AQDrlTdmHNXYj4hJAg9QHIVJRKHyyMeJwbRbAgKXI/BRpaECw8qDN1dfgkZK6B+5Hu1W4wxiUSxunWYgM8uz8EqhyZfaHxsy/eQobBPbF7GUpSZadpUHJ1kjM4Dc7XSfRyUrJKQx3lvUYTmUsxho8m/r4Bw/skzpepuq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726842014; c=relaxed/simple;
	bh=57XzM5CSGWeVZRIhqQSfkAgaC6Mb7CGyUkP+XadZxzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2AEefeKMulXF5HPU6CLw/cL5oof4U667r3f08RI9hykKrktmPt8osdyfE19hTRrI5nS5FPqUrMk4ar46fSL6p3WxDVhzy3pD6qgzRsOYH9b7f/MbKo1ZP8AIIhWln5NKsioW/gVBOvPfpBM5zUwgdOfKXzpkVix6kp2XbKBfvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F7AC1007;
	Fri, 20 Sep 2024 07:20:38 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.52.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BFCF3F66E;
	Fri, 20 Sep 2024 07:20:05 -0700 (PDT)
Date: Fri, 20 Sep 2024 15:19:58 +0100
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
Message-ID: <20240920141958.GA288724@e130802.arm.com>
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
 <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
 <gzlncpyzwm7x4jcxtdrthrlv2dofk7u3oxn4taadwog5tt37wo@ot6s6kwukd4k>
 <20240919093517.GA43740@e130802.arm.com>
 <222b3b11-151a-4ad0-91ea-54ae8f280bcb@kernel.org>
 <20240919145741.GA7940@e130802.arm.com>
 <85a223e9-05a4-4034-87a5-57d3eb9409b7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85a223e9-05a4-4034-87a5-57d3eb9409b7@kernel.org>

Hi Krzysztof,

> >>>>> +  '#extsys-id':
> >>>>
> >>>> '#' is not correct for sure, that's not a cell specifier.
> >>>>
> >>>> But anyway, we do not accept in general instance IDs.
> >>>
> >>> I'm happy to replace the instance ID with  another solution.
> >>> In our case the remoteproc instance does not have a base address
> >>> to use. So, we can't put remoteproc@address
> >>>
> >>> What do you recommend in this case please ?
> >>
> >> Waiting one month to respond is a great way to drop all context from my
> >> memory. The emails are not even available for me - gone from inbox.
> >>
> >> Bus addressing could note it. Or you have different devices, so
> >> different compatibles. Tricky to say, because you did not describe the
> >> hardware really and it's one month later...
> >>
> > 
> > Sorry for waiting. I was in holidays.
> > 
> > I'll add more documentation about the external system for more clarity [1].
> > 
> > Basically, Linux runs on the Cortex-A35. The External system is a
> > Cortex-M core. The Cortex-A35 can not access the memory of the Cortex-M.
> > It can only control Cortex-M core using the reset control and status registers mapped
> > in the memory space of the Cortex-A35.
> 
> That's pretty standard.
> 
> It does not explain me why bus addressing or different compatible are
> not sufficient here.

Using an instance ID was a design choice.
I'm happy to replace it with the use of compatible and match data (WIP).

The match data will be pointing to a data structure containing the right offsets
to be used with regmap APIs.

syscon node is used to represent the Host Base System Control register area [1]
where the external system reset registers are mapped (EXT_SYS*).

The nodes will look like this:

syscon@1a010000 {
        compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
        reg = <0x1a010000 0x1000>;

        #address-cells = <1>;
        #size-cells = <1>;

        remoteproc@310 {
            compatible = "arm,sse710-extsys0";
            reg = <0x310 4>;
            ...
        }

        remoteproc@318 {
            compatible = "arm,sse710-extsys1";
            reg = <0x318 4>;
            ...
}


[1]: https://developer.arm.com/documentation/102342/0000/Programmers-model/Register-descriptions/Host-Base-System-Control-register-summary

Cheers
Abdellatif

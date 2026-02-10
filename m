Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231432E9729;
	Tue, 10 Feb 2026 06:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770704048; cv=none; b=ZpfOUGWdxFgY2GCAHtU4/nlKU9W2oYUT4B5ZgjYzMat3jIGycNf1O6e15rKOYsSrf6e9yPY41p9itsRSyw5LlomuoO24LjkQOt9KL8DKg1MuTUXimRKDnr15PRRuCdPrrNC/nCuCLbqQmsz8nP3+rvKelFMTCPQmbcKt7Hzk+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770704048; c=relaxed/simple;
	bh=NOoZ/TSgvmHM8MvVRv66uYCD2q1u3i1JerRCuxg/nYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RK8bu5VBSsF887rN3OxS00XFLs6CjBixLVoUY+vRYKGsWuoZDE1LsiY965178MYAa6ymQxMCEDWK/sWrga7jukBttmIXRoDhWEdL9EEffhD1ufqLaNtYFH9EtahrEktLjTwzK104E0+q2K7dogsIPJrE3+s3l3XwpMvFodfaqfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyF7BGSO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyF7BGSO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8796C116C6;
	Tue, 10 Feb 2026 06:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770704047;
	bh=NOoZ/TSgvmHM8MvVRv66uYCD2q1u3i1JerRCuxg/nYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyF7BGSOacd8nQFeoyK69yTrIr6WEkiceyw4AmLFO/LBQGkpzoYRL1Vq5peFNPXe5
	 2GRB93lvaDKY5I95NdSIEuSaoLOw+lFX62Vn/TwPEa9Foqr2ip4DHypDXObc0s47hm
	 l9cluPBg1t1rZcpe3oVwhndSnk7Fq7d/VVseZG6N4sgGTylUK45zCAX5cliiSo6+jt
	 Mo91W1qf9xn5E1n3sp/ZH6wUnhHCefuLoo6zDX0kFRKpBbjJCABmCXEKRONaCkbyhB
	 bkeUykXpi+rRobG0QkSxwlMXFlViarS0V5Xg7DPijQAOTHtIPVfinRdmfJPm9O0Ipa
	 SjUbczIUskKLg==
Date: Tue, 10 Feb 2026 11:43:59 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	op-tee@lists.trustedfirmware.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v20 1/6] dt-bindings: firmware: Add TEE
 remoteproc service binding
Message-ID: <aYrMp9wqk91-tQXn@sumit-xelite>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org>
 <aVOzHWmlJ-eneS-2@sumit-xelite>
 <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
 <aVtqITUxy--E8HJt@sumit-xelite>
 <49f1808d-1e08-4f47-ac3a-5f2274086060@foss.st.com>
 <a17c017a-15f5-4ebc-9dd0-baab718dbe0a@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a17c017a-15f5-4ebc-9dd0-baab718dbe0a@foss.st.com>

Hi Arnaud,

On Tue, Feb 03, 2026 at 08:42:34AM +0100, Arnaud POULIQUEN wrote:
> 
> Hello Rob, Sumit,
> 
> Just a gentle reminder. Could you please provide your advice or a conclusion
> on the direction we should take for the DT declaration? I need your input to
> be able to move forward.
> 
> Thanks and regards,
> Arnaud
> 
> On 1/13/26 10:20, Arnaud POULIQUEN wrote:
> > Hello,
> > 
> > On 1/5/26 08:37, Sumit Garg wrote:
> > > On Fri, Jan 02, 2026 at 04:17:27PM -0600, Rob Herring wrote:
> > > > On Tue, Dec 30, 2025 at 5:10 AM Sumit Garg
> > > > <sumit.garg@kernel.org> wrote:
> > > > > 
> > > > > On Mon, Dec 29, 2025 at 05:25:30PM -0600, Rob Herring wrote:
> > > > > > On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
> > > > > > > Add a device tree binding for the TEE-based remote processor control
> > > > > > > service implemented as an OP-TEE Trusted Application identified by
> > > > > > > UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> > > > > > > 
> > > > > > > The TEE service node is a child of the
> > > > > > > "linaro,optee-tz" firmware node and
> > > > > > > acts as a container for remoteproc devices that are
> > > > > > > controlled via TEE.
> > > > > > 
> > > > > > Is this generic for any remoteproc device or just ST's
> > > > > > remoteproc. Looks
> > > > > > like the latter to me.
> > > > > 
> > > > > That's true, the DT description of the remoteproc subnode is very
> > > > > specific to the vendor which in this case is ST.
> > > > > 
> > > > > > 
> > > > > > > In addition, the "linaro,optee-tz" binding is updated to specify the
> > > > > > > '#address-cells' and '#size-cells' values used for child TEE service
> > > > > > > nodes.
> > > > > > 
> > > > > > I'm pretty sure I already rejected per service/app child nodes for
> > > > > > OP-TEE when its binding was submitted.
> > > > > 
> > > > > That was the reason to have discoverable TEE bus in first place and I
> > > > > have been motivating people to dynamically discover firmware properties
> > > > > rather than hardcoding in the DT.
> > > > > 
> > > > > > If we do need something in DT
> > > > > > to define some resources, then can't we have some sort of
> > > > > > standard/common communications channel? I don't care to
> > > > > > see some sort of
> > > > > > free-for-all where we have every vendor doing their own thing. OP-TEE
> > > > > > needs to standarize this.
> > > > > 
> > > > > I suppose this requires a wider scope work as you can see
> > > > > the DT resource
> > > > > dependence from here [1]. By standardize communication channel, do you
> > > > > mean to say if adding an alternative backend to fwnode for TEE in
> > > > > parallel to DT, ACPI or swnode is the way to go for discovering fw
> > > > > properties?
> > > > 
> > > > No, not at all.
> > > > 
> > > > > Or do you have any other suggestion here?
> > > > 
> > > > What I mean is why doesn't the TEE define the communication channel
> > > > (mailbox+shmem and notification interrupt) rather than each TEE app?
> > > 
> > > The synchronous communication channel is already there for each TEE app
> > > based on (invoke commands + TEE shared memory). OP-TEE does support
> > > notification interrupts too but those haven't been exposed to TEE client
> > > drivers yet. I suppose this remoteproc use-case can be a good example to
> > > expose that as a generic TEE notification interface too.
> > 
> > In the STM32MP series, the mailboxes and shared RAM are used for RPMsg
> > communication between Linux and the remote processor. My concern is that
> > using notification in OP-TEE could impact performance by introducing
> > latency. Additionally, this might require a DMA allocator in OP-TEE to
> > manage the shared memory. One RPMsg virtio requires the declaration of
> > at least three carveouts. Managing these as memory regions in OP-TEE
> > would be complex (due to limited number of memory area declaration on
> > STM32MP2).
> > > 
> > > > 
> > > > More generally, is having TEE apps depending on random DT resources
> > > > really a box we want to open? Is the next thing going to be a TEE
> > > > clock/reset/gpio/power provider? Where do we draw the line?
> > > 
> > > This is really a hard line to draw since silicon/OEM vendors based
> > > on their
> > > hardware security architecture partition various resources among TEE and
> > > the Linux world. And one general principle we try to follow for the TEE
> > > is to keep it's Trusted Computing Base (TCB) to a minimal too.
> > > 
> > > IMHO, if the threat model is well understood then we should allow for
> > > this hetrogenous partitioning of system resources.
> > 
> > Here are some additional resources we need to manage the remote
> > processor, which seem complex to handle without Device Tree (DT):
> > 
> > - Clocks: On STM32MP, we manage clocks through the OP-TEE SCMI service
> >    [1]. The SCMI OP-TEE clock/reset service already exists and should be
> >    reused.
> > - Power domains
> > - Remoteproc Watchdog interrupt: Cannot be caught by OP-TEE on
> >    stm32mp15.
> > - Graceful shutdown of the remote processor: This involves sending a
> >    mailbox notification to request shutdown and waiting up to 500 ms for
> >    the remoteproc to deinitialize its resources. Waiting this long in the
> >    secure context seems inefficient.
> > - compatibility with some coming IPC mechanisms: Such as rpmsg_I2C or
> >    virtio-msg might require remoteproc subnode descriptions in the
> >    future.
> > 
> > If the proposed topology does not gain consensus, what about an
> > alternative approach that manages the remoteproc TEE similarly to SCMI,
> > by introducing a remoteproc-backend with the proc ID as a parameter?
> > 
> > 
> > &firmware {
> >      optee: optee {
> >          compatible = "linaro,optee-tz";
> >          method = "smc";
> >          sproc: sproc {
> >              compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
> >              #address-cells = <1>;
> >          #size-cells = <0>;
> >          };
> >      };
> > };
> > 
> > rproc1: m33@0 {
> >    [...]
> > 
> >    remoteproc-backend = < &sproc 0>
> > };
> > 
> > 
> > rproc2: m0@0 {
> >    [...]
> > 
> >    remoteproc-backend = < &sproc 1>
> > };

Using a phandle like this makes it a bit more cleaner but I would defer
to Rob since he has the final say here.

-Sumit

> > 
> > 
> > [1]https://elixir.bootlin.com/linux/v6.18.4/source/drivers/clk/clk-scmi.c
> > 
> > Thanks,
> > Arnaud
> > 
> > > 
> > > -Sumit
> > 
> > _______________________________________________
> > Linux-stm32 mailing list
> > Linux-stm32@st-md-mailman.stormreply.com
> > https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
> 

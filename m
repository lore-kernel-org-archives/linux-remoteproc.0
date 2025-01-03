Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30271B6D0D;
	Fri,  3 Jan 2025 06:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735884325; cv=none; b=WPQQHrD+77ZlirJGBabY/F0DMX4LWvMkoGt8/4Eas595KCgLgUSjM2ViJCGq1eHXNR3SKUSGDzGUNyhJCVGuuRiHaKe3xJxiaG474ScRvWl+96pHBwno4nqCCo4N7G8BRTKfFgc1R1olvbIhVN49I/QQRAHGM/pMpfPETeI80O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735884325; c=relaxed/simple;
	bh=okWX+fjQmXrvk45VEoCZ+Q9oztSmAhEXGYY8o5Sy3Uo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSK0cDuLoAwJbJN1imTMy4rIEBSko766FSAt+1pH6ze7lsLkJOcEx1Akj6eUuXl8pWdicgcxgTVLQFtlnSnqD3JHQ+evJltouiIWFj2n8/ExtBN4YXTwgMUsxQt4EQL9Y0oOV1/Y8XGBRKENrQPfCfotiI7XDVstMoOr/7MaP7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Fa8K1Rta; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Fa8K1Rta"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50365C8J067134;
	Fri, 3 Jan 2025 00:05:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735884312;
	bh=I8pRNxrkusnevfNHKn1KvGEDCe6LelDeuYB+c27wkys=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Fa8K1Rta0G6Gp9j0EngCnNV76LuVHFLkZDFufi1aeUel4nuXElgVVRb+w83tEsXZm
	 NtrKhVheVhDJVXhQEbK8PQrtFRtf4O1ZANTQpppzBeRjMO3/ZcxS3tBIpCmvoX9dZg
	 gJdKwro8mqtPkgrOBa4PYr2wWM19L6M++bRZuNZo=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50365C1f098905
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 00:05:12 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 00:05:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 00:05:12 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50365Bhj093400;
	Fri, 3 Jan 2025 00:05:11 -0600
Date: Fri, 3 Jan 2025 11:35:10 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <afd@ti.com>,
        <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <srk@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] remoteproc: k3-r5: Fix checks in
 k3_r5_rproc_{mbox_callback/kick}
Message-ID: <66zjmdlfm5ou2ayivndckoz6zi4octnet44rcvdxuz6dmallqq@x3g7lyzicpiv>
References: <20241224091457.1050233-1-b-padhi@ti.com>
 <20241224091457.1050233-2-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241224091457.1050233-2-b-padhi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue, Dec 24, 2024 at 02:44:55PM +0530, Beleswar Padhi wrote:
> Commit f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during
> probe routine") introduced a check in the "k3_r5_rproc_mbox_callback()"
> and "k3_r5_rproc_kick()" callbacks to exit if the remote core's state
> was "RPROC_DETACHED". However, this caused issues in IPC-only mode, as
> the default state of the core is set to "RPROC_DETACHED", and the
> transition to "RPROC_ATTACHED" happens only after the "__rproc_attach()"
> function has invoked "rproc_start_subdevices()".
> 
> The "rproc_start_subdevices()" function triggers the probe of Virtio
> RPMsg subdevices, which require the mailbox callbacks to be functional.
> To resolve this, a new variable, "is_attach_ongoing", is introduced to
> distinguish between core states: when a core is actually detached and
> when it is in the process of being attached. The callbacks are updated
> to return early only if the core is actually detached and not during an
> ongoing attach operation in IPC-only mode.
> 
> Reported-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Closes: https://lore.kernel.org/all/20240916083131.2801755-1-s-vadapalli@ti.com/
> Fixes: f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during probe routine")
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351BF155C97;
	Fri,  3 Jan 2025 06:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735884385; cv=none; b=FAcjO2xTrbN7egxGsXvjgTBynoOhdq0wyc1nJ+GTzvmuK+8untGRYW4Qd46Z9oc7M2WUoBLlJJMOu4YJirsD8EulXdeN74G70PH66AA/Mm8uQjaXKfvZ2GI3+tjpIsFFBl5qC6liikNx44DgB3Vz0avMVQppWQ9eTOJUlxBZFhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735884385; c=relaxed/simple;
	bh=kAxEE2k2Yq6ncb2HwgEiz3rC/oX50q9wGyBZjM8HW3s=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IB5/3CCCL+X8Lpj4nJEj6IC008zWzkH3PQp+9BCriO/JOl4s4pb4gNAJe32dcZdupDIj474M6ChaesLRXuH255nLYZBR0gJQRnGy+a8Ye68eCYACLR/jp2P4A4LVAt0xNkMeaL68ayTs0biv//OXo0SqpOSGcLg8FY7H9naTCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZcbYvN7z; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZcbYvN7z"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50366CVq2049687
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 00:06:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735884373;
	bh=6bA2Zmx73rw2PcbScdjMB9Aq1bvYHJkmb80SRkP3N90=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZcbYvN7z/ZfezF/UE51BNhgH0OWIkTuovl7+bAMhhteG5UddP1ziYa2BZ28cO9Q7I
	 jRUzhY/o+gPY9AJmKU3M3DbYbGLqnbFmfZ7ATvOzOCcLkadRDW6jjXqMYMBBZ2NZro
	 C4CDoPRzpH4U4CdWQnl9t9NzFORdtSBdtFug4ZPI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50366CrQ099874
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 00:06:12 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 00:06:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 00:06:12 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50366BO8094805;
	Fri, 3 Jan 2025 00:06:11 -0600
Date: Fri, 3 Jan 2025 11:36:10 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <afd@ti.com>,
        <hnagalla@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <srk@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] remoteproc: k3-dsp: Fix checks in
 k3_dsp_rproc_{mbox_callback/kick}
Message-ID: <7itggfhhmtn5nh6hnp35cdwvzbb72ikmrxeqgympccnfmpyzes@ss2lqb6snlo7>
References: <20241224091457.1050233-1-b-padhi@ti.com>
 <20241224091457.1050233-3-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241224091457.1050233-3-b-padhi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue, Dec 24, 2024 at 02:44:56PM +0530, Beleswar Padhi wrote:
> Commit ea1d6fb5b571 ("remoteproc: k3-dsp: Acquire mailbox handle during
> probe routine") introduced a check in the "k3_dsp_rproc_mbox_callback()"
> and "k3_dsp_rproc_kick()" callbacks to exit if the remote core's state
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
> Fixes: ea1d6fb5b571 ("remoteproc: k3-dsp: Acquire mailbox handle during probe routine")
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

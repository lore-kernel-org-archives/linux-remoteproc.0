Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2159C1EF38D;
	Wed,  2 Apr 2025 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601741; cv=none; b=ZT9E39AwkSI9CIrkw7Sm8zrVzzosyszB9p8haBsByVi5Ph4ZJpkNMKaB4/Mq4K9Yt2fTdBin5GqwgQjMFfTlaTO3TO+jUYOauksbRqJpWymKG+vrblhtQO8oRGfePiU9XCxHSxn2gAhmClGiuY5UNKxbLcqKJzhDn9wRUYlVK5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601741; c=relaxed/simple;
	bh=iF3h5lO8+LkzJaWgRh4/l9CWOxAZGLcBdWVaV+l4EQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2GrDbZ2W+dvXxP2TbAMV5gnEUzdBAYXAHV4+xSD0xE1Zn+WcYg0ztsey2u2ci5j0SKN1NesnAoL05S+opd3nRx2O9ZHIL9OfenIPCHFZNRnBq/OxqcP/9P99MW+yZPQUfz+TVN2raaNSZ4KUnARdIX6FboTo/j3BY30SIMl19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RytdIJ6l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RytdIJ6l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15056C4CEDD;
	Wed,  2 Apr 2025 13:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743601740;
	bh=iF3h5lO8+LkzJaWgRh4/l9CWOxAZGLcBdWVaV+l4EQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RytdIJ6lChzNOIvUA1fsYFhtbX/qeIoji3bQ2HvZLUDHKBIgffSN0WJh5O9CzpDdS
	 aXYiyUxfEeg6xZoTVRPfblVm3hGRU3VZNKj0G5RDcQYZ5aNkznkQx9jL3LgHb9PRoE
	 Z3Kq+ZQlXxQHEBPrqaWaY2QppW6PCh4HZBNPtbnvDW7Ujh9wsj+540cm5NiRr/6Ctd
	 hBnJELVkSins6JyeciyE1AHaw6EBME66PhxluwJ++VEaRaLjsxvmNnwlAAlQsc5IKI
	 MsuXKqRQTqdPvE80NDM+KJS/AHeoH65Jz16+0dbL9f5dn4nVMyn9Z3j9+2uJ0cVHTK
	 r+zjI92MCafew==
Date: Wed, 2 Apr 2025 08:48:58 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Arnaud Pouliquen <arnaud.pouliquen@st.com>, 
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <v5xgigrvpy6shmgdkivmxywkacsubnsimk6vyrue4mmoyufpbk@br7lnyvtnatc>
References: <20250326020215.3689624-1-peng.fan@oss.nxp.com>
 <Z-WO-fhDJKyG7hn2@p14s>
 <20250328045012.GA16723@nxa18884-linux>
 <Z-au0USkvoDYTF7A@p14s>
 <20250329125629.GA11929@nxa18884-linux>
 <Z-q3ebPSjkSPVlgP@p14s>
 <20250401014124.GB15525@nxa18884-linux>
 <Z-wOr3eLaX9myqb4@p14s>
 <20250402014355.GA22575@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402014355.GA22575@nxa18884-linux>

On Wed, Apr 02, 2025 at 09:43:55AM +0800, Peng Fan wrote:
> On Tue, Apr 01, 2025 at 10:05:03AM -0600, Mathieu Poirier wrote:
> >On Tue, Apr 01, 2025 at 09:41:24AM +0800, Peng Fan wrote:
...
> >
> >The core is already checking if @loaded_table is valid in rproc_start(), why
> >can't that be used instead of adding yet another check?
> 
> Ah. I was thinking clear table_sz in rpoc_shutdown is an easy approach and
> could benifit others in case other platforms meet similar issue in future.
> 

I like the general idea of keeping things clean and avoid leaving stale
data behind.

But clearing table_sz during stop in order to hide the fact that the
future table_ptr will contain valid data that shouldn't be used, that's
just a bug waiting to show up again in the future.

Regards,
Bjorn

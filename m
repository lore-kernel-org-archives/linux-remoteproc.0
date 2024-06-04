Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EC183CD6;
	Tue,  4 Jun 2024 20:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717532318; cv=none; b=M5Q7vGR0S9YOfJC7Zzx2S0nHGvMhDSBXGD/LaDI2Ih3WQr3NlKmj//4o1KBQUdXKkXsz1EDcumBjSJ7NL/v3eGA7KxSFAXEO6wlccqefXUwigVkNYkbtApLmH8VSMf5R0KAq6JoUh09JuHPBmt6nBjT8xqUK7JDD6aCRXAQu994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717532318; c=relaxed/simple;
	bh=0BUG/LD9w8zBQ2o9IC9TBMii5AV3XOnsct+AhdNAvC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaRjzo6VyYt7cqUOmXIWeA5ua4wRDRqa+FheyOl7XOek7lhzEan9Fv5M+BIWSKDB+NwgGeSEpABVG5fxG0JgXyLy+NSMd/0pu1Ap695uimvWvw4SV5HHWunzyX1Pg7SenP9XJzS/cH2xdmQWIcou/andgeWpSz0lrPtkSM5bi18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/f3Iijk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/f3Iijk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654A0C2BBFC;
	Tue,  4 Jun 2024 20:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717532317;
	bh=0BUG/LD9w8zBQ2o9IC9TBMii5AV3XOnsct+AhdNAvC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/f3IijkXHpGZlqdkTyZwG9/hvQG39wN9CC6UZmYLCyotLJmTS8LD7oWFDiIL9mwy
	 Qq9UtHgeaSHl6SQscw63XGk7nsnXl8iPNu+VHKRW6VJbH/hLd/kbtHod3TH2BsGj9v
	 prD16ii84Co6NdmVSx6CfqFdNOgbo24XlcUzdaZGiV8vZqXNvgMRuyv9Ro3rOvVYQ+
	 3dmUwyn7+lsSDJnXWyeahEZQOJZ0QS2j1M2uMxCePyX0/zPyGQnhvd59akO/1YnyZb
	 dl+eebSo3Mm9nHiUZDpzQcPGAy70xOejzqCSK9a3dsuJZ1WSSfd++YghskQNgWRNcj
	 CiAXUVCNlSSwg==
Date: Tue, 4 Jun 2024 13:23:45 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drivers: remoteproc: xlnx: add attach detach support
Message-ID: <chqsvuwi7gukbw3l2y6xoxmd3lh6vlqhs2wjd4lylbhsg5m2hc@vnmesij3xoiu>
References: <20240603203437.973009-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603203437.973009-1-tanmay.shah@amd.com>

On Mon, Jun 03, 2024 at 01:34:38PM -0700, Tanmay Shah wrote:
> It is possible that remote processor is already running before
> linux boot or remoteproc platform driver probe. Implement required
> remoteproc framework ops to provide resource table address and
> connect or disconnect with remote processor in such case.
> 

I know if changes the current style for this driver, but could we drop
"drivers: " from the subject prefix, to align changes to this driver
with others?

Regards,
Bjorn

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6951E505;
	Sun,  8 Mar 2026 14:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772979747; cv=none; b=SkkTuFnur1hNsN5S9QXISdTejy5/8TWkeQ8p6wkOeRqDXRiAZZpUcTJuj+zMmJnnW/sD6oXFKy1cD6L1FJArazDSpEay4MhJXlGsDfL9oVlpAHchLiESc7TcHCymhgt2/WQheig7o08vufWccefNq8BxK6qRouWep1+I7maEi2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772979747; c=relaxed/simple;
	bh=bda7SNgS19b5IeODHlmEs/fQBF59nFEBR8f1GNjzqj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loE0CAQLCE49Mn4CzdFx3LdreDSPhbzXa6JMA9n6zh7So8UF6/UUnjkSW6WFRe4D/QoVzUEdJdSkpoOQy+motVOegkuazlz8gC397juiKKUI3xWKB7rMyvehhqsaFzzVzo8pFyqKdpdILwWRG9FnoB9ecKl45MZlbosG962Y7cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fWQHLq8l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fWQHLq8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8DDC116C6;
	Sun,  8 Mar 2026 14:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772979746;
	bh=bda7SNgS19b5IeODHlmEs/fQBF59nFEBR8f1GNjzqj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWQHLq8lwkhDP5k4nUPt2a2rSYxtPwTfuJnIGz6f/RD41LR6Vw76Fg241KcySkUK+
	 /swCqvaEWh4a2Mo6mXMAl152zSfQhoryusLWRmzGBRDl4WxqM+T1+XwAiV6ZIiHSgH
	 Mg+l7YShG/7Orvr+CtOVoHNI3oxl7OsOxFNtMLXY=
Date: Sun, 8 Mar 2026 15:22:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	"open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers: rpmsg: class_destroy() is deprecated
Message-ID: <2026030817-autism-whisking-391f@gregkh>
References: <20260308140850.1138376-1-jkoolstra@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308140850.1138376-1-jkoolstra@xs4all.nl>

On Sun, Mar 08, 2026 at 03:08:49PM +0100, Jori Koolstra wrote:
> The class_destroy() function documents that:
> 
>   Note, the pointer to be destroyed must have been created with a call
>   to class_create().
> 
> However, class_create() is deprecated. rpmsg already uses
> class_register() but the class_destroy() calls should also be replaced
> with class_unregister().
> 
> Link: https://lore.kernel.org/all/2023040244-duffel-pushpin-f738@gregkh/
> Signed-off-by: Jori Koolstra <jkoolstra@xs4all.nl>
> ---
>  drivers/rpmsg/rpmsg_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

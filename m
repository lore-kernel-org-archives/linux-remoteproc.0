Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8073233B6DC;
	Fri, 31 Jul 2026 02:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466186; cv=none; b=q4zZaJduh1hj5Hbmk0nHAlPqxr8BeSdGJ/9V0JyQMLukjzPG9K6B5sRjFQDz4cdWFkLfIG4ChYCz16Mb0UuHt1ozU+5maRnVr8ODQUP8UBKrDkqxeK97IZ/f/WlItl+oT88X+Efd9T1byg4kEXz4ZEhhM4SHJbufwYIQD+zhaCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466186; c=relaxed/simple;
	bh=LaXzZPKp9iQImUe3nismOiSCdHYPI3FsS1VqLNsh+eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDvwQap0vR3WNX0Qifi5DfJzB5DWquuSUJ2d6mev0p11vqcigUlLqm/CZaRaLGw1DRZEIj+2rIxvyovtHSFztFRDICPAKIbW3t+ttbxDWXOSpIajAqdbTML4CxAiIP3bTrlVr7EQdaba7bRLEnFSQUA8Zm+QRi5sOsbttnlt3nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUFf50DD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUFf50DD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E5D1F000E9;
	Fri, 31 Jul 2026 02:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785466185;
	bh=dwUfEqCbSsnlkxzn2YVBAYsM04yaIepQlky18P+cG7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aUFf50DDNNwfr8URmc5vnZ7GgMHz4xIx2h6MwwpqhaSoxSLNzXxm0jD2e3l0bKPn+
	 RVT7NkbLBEAjls/XBtRy4apIUL6GnGxyO6FW59XS+lkGv6M8RVW9cEJYiuo6mL0Ghi
	 7GypsNpkohT8TuaAmIrVUFWPQMfJKK5dO6TzXegukMoN+aKcsyFtLX7JzWs9Ux+Mv6
	 ArExOp+lqnXGqKjMDomlmkmXmYaPQcpNpUAARksHcqdfK6nq9LqtIz0fh6mGv12p5f
	 UjpY2yeVFbR8imemxWzS52XnfX9jhnU9KxlXfPut9FqjzzRhTZzZN+1TTA4i64Vzza
	 jizGzDauquk5Q==
Date: Thu, 30 Jul 2026 21:49:42 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 3/5] remoteproc: add SPDX-License-Identifier tag to
 remoteproc.h
Message-ID: <amwNE675wplIYEy2@baldur>
References: <20260724184132.1878077-1-mukesh.ojha@oss.qualcomm.com>
 <20260724184132.1878077-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724184132.1878077-4-mukesh.ojha@oss.qualcomm.com>

On Sat, Jul 25, 2026 at 12:11:30AM +0530, Mukesh Ojha wrote:
> Add the missing SPDX-License-Identifier tag consistent with the
> BSD-3-Clause license text already present in the file.
> 

Looks like the standard BSD blurb, so I think you should take the
opportunity to replace the blurb with the SPDX header, not "duplicate"
the information.

Please update both patches.

Regards,
Bjorn

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  include/linux/remoteproc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 9cd0708d5ac9..e6b8fbb0af8e 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: BSD-3-Clause */
>  /*
>   * Remote Processor Framework
>   *
> -- 
> 2.53.0
> 

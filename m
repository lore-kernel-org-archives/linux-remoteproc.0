Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6CB305678;
	Tue,  4 Aug 2026 22:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785881529; cv=none; b=KAkOsq31AR73h46th72KGcqrkFtxjLB8rjHFViI5HUgaXLq/823CTmK1Vjtu4PEyDT8UAo0Y/TXQ7F9CrTIPYwnqFASoDKQazogtyo0dE1fc46O/kaKM1X2nMsrJki0W/Tk7FuW7R428ksFxO8TqqyJyDewpsi+WqBRSBZ7K1pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785881529; c=relaxed/simple;
	bh=NRR9zjGR9RXWKXQSmzHqXYyhgydAiT69JYSOIk4Dc1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCYxLkYZMEkl0RTsBPcekLp84VmNVZpjr14P5o3Ja5rAVSdz7juIVHWEelj3mz+gTOhrHe0dCEYmfCAjA5jp+XEnldJ5vGreehregtqUOVGZm0hmWvMpy2dqbBcKXnY2xfvjvydUo7n4rUPSToNJYEEQlGUl2B1lYNkalu8HjR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnWjW/L+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnWjW/L+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B7B1F000E9;
	Tue,  4 Aug 2026 22:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785881528;
	bh=ekiVznzlj2Q9Dm951AUb5P7ijtlf8mP/s7EDVfrP6p0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jnWjW/L+Bn2+NJCvJR5iqH0oMnTQkM/ZJD+3NiQJWYEOnyMy60FyyaHEiIOkvzBtf
	 NDi4dUzBz3urxKTMZzSfV1BgWauhzfKLkk1S75AlJ4DTYi3BFLyhZt8qhzNjU6rhTF
	 kA6d9BoD9dbSXmqfcLGYmFSJHUJWMasYiECN0+wNb98w74WNgVoW4ctV/p6Rye5eOH
	 6LeS10stjISTZ0CEs9Q7Cp/pvFDUQz/viIuU+Nc9mg8awBEBdSvhJdFMyChwMS+4AQ
	 i00F2214f7xEN0NVPiJsAJq37ykxc1GzhrbyQZqCl6wd4/ogw6XSlcWIc6HtJ64YUy
	 0mE1dfCdo0Vbg==
Date: Tue, 4 Aug 2026 17:12:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 5/5] remoteproc: fix OOB read via signed offset in
 rsc_table_for_each_entry()
Message-ID: <anJjeJQcf18MgKRg@baldur>
References: <20260803114331.3277263-1-mukesh.ojha@oss.qualcomm.com>
 <20260803114331.3277263-6-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803114331.3277263-6-mukesh.ojha@oss.qualcomm.com>

On Mon, Aug 03, 2026 at 05:13:31PM +0530, Mukesh Ojha wrote:
> table->offset[i] is a u32 from firmware, but was stored into a signed
> int.  A crafted offset like 0xFFFFFFF0 becomes -16, placing hdr 16 bytes
> before the table buffer.  The subsequent avail check was bypassed
> because the negative int was promoted to a large size_t in the
> expression "table_sz - offset - sizeof(*hdr)", yielding a large positive
> avail and letting the out-of-bounds hdr->type read proceed undetected.
> 
> Store the offset as u32 and validate it with unsigned comparisons before
> any pointer arithmetic.
> 

Fixes: fd2c15ec1dd3 ("remoteproc: resource table overhaul")

Regards,
Bjorn

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  include/linux/rsc_table.h | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
> index 0ad9122c22af..71b60125310e 100644
> --- a/include/linux/rsc_table.h
> +++ b/include/linux/rsc_table.h
> @@ -310,17 +310,22 @@ static inline int rsc_table_for_each_entry(struct resource_table *table,
>  	int i, ret;
>  
>  	for (i = 0; i < table->num; i++) {
> -		int offset = table->offset[i];
> -		struct fw_rsc_hdr *hdr = (void *)table + offset;
> -		int avail = table_sz - offset - sizeof(*hdr);
> -		int rsc_offset = offset + sizeof(*hdr);
> -		void *rsc = (void *)hdr + sizeof(*hdr);
> +		u32 offset = table->offset[i];
> +		struct fw_rsc_hdr *hdr;
> +		int avail, rsc_offset;
> +		void *rsc;
>  
> -		if (avail < 0) {
> +		if (offset < sizeof(*table) || offset >= table_sz ||
> +		    table_sz - offset < sizeof(*hdr)) {
>  			dev_err(dev, "rsc table is truncated\n");
>  			return -EINVAL;
>  		}
>  
> +		hdr = (void *)table + offset;
> +		avail = table_sz - offset - sizeof(*hdr);
> +		rsc_offset = offset + sizeof(*hdr);
> +		rsc = (void *)hdr + sizeof(*hdr);
> +
>  		ret = cb(hdr->type, rsc, rsc_offset, avail, data);
>  		if (ret)
>  			return ret;
> -- 
> 2.53.0
> 

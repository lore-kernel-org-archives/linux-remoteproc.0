Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A511D9A6F;
	Mon, 14 Oct 2024 23:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728949017; cv=none; b=SXlWJuptPq5hen3YqlUMLQqoy3FiKJW5/eczb1HP7wTJOy40jK4sXR+BNq7qi6fc+A0ShJAeIFxuHEjz8JKTC0bm6t5g0bAWu3oLjIXVc94oKWKdHvvtaEREzkPV/KLO/bUaf6JtNw3GSlLmDzNYSlPKDvMMBDbBl57JqMuAY0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728949017; c=relaxed/simple;
	bh=aEYfd+irzfCo/P1ISiBPvIl+H1cO9NIiTbWBKh5EdkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5euqDbRs3RdtdeFB5CAenVIltH0whgydf1x6See5oSOIHm7fQpRXuiK0O9wviS2TuJPoMKrSJ965cGo2mKbplG01Vtghvq+mXlTECssfSe2eaOtTZ+0A1yVIeqBIneM/IoFcHVfzWNrYjyJiJXcReoqmvW+EX8rPx10wb2jSSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1IiPZ3D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1IiPZ3D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C035C4CEC7;
	Mon, 14 Oct 2024 23:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728949016;
	bh=aEYfd+irzfCo/P1ISiBPvIl+H1cO9NIiTbWBKh5EdkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1IiPZ3DYRgiO+7kFv+VsXTKeFc2fYBVAt7Wv9GnoIQyRH+eMVFgqCi0wfxNPwlY4
	 f7JBOehb0Y2t2KHfzY/feU2W1d1/uenOlFOD/vIPBgYq4s83KM476ftqyhmfcZI2Bb
	 k9ZVUeuYdqP/oXqqlyTiOGTohjNqvFreRR1lgKzSP6/K550836hEX8Ve9/j4K9AvTW
	 NENPNOpQU8FS8qLMTjzCi9fkgk4jRymmd9ftJg0DUknryH4sl8klqHbIS2Hptt8onE
	 QKc2R0fLmKxQGuUjhC/icrBIz6df26qSImiBZJU48doCFKfh0K8noa3SxzOjp5kmV0
	 71knPoZgdUZQw==
Date: Mon, 14 Oct 2024 18:36:53 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: anish kumar <yesanishhere@gmail.com>
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: elf_loader: redundant check remove
Message-ID: <jerzlrs3vwtf6wb4bhgprmsdmfm7usv7qec34hfzj7q6oxhqwd@7isqdegmqwei>
References: <20241014054820.59860-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014054820.59860-1-yesanishhere@gmail.com>

On Sun, Oct 13, 2024 at 10:48:20PM GMT, anish kumar wrote:
> offset will always be positive number and adding
> and comparing to the same variable 'size' will
> always result in check being false always.
> Remove this superfluous check.
> 

What if offset + size overflows?

Regards,
Bjorn

> Signed-off-by: anish kumar <yesanishhere@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index 94177e416047..c6d893e9c15e 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -278,7 +278,7 @@ find_table(struct device *dev, const struct firmware *fw)
>  		table = (struct resource_table *)(elf_data + offset);
>  
>  		/* make sure we have the entire table */
> -		if (offset + size > fw_size || offset + size < size) {
> +		if (offset + size > fw_size) {
>  			dev_err(dev, "resource table truncated\n");
>  			return NULL;
>  		}
> -- 
> 2.39.3 (Apple Git-146)
> 

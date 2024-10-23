Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A621C75E4;
	Wed, 23 Oct 2024 13:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729691603; cv=none; b=hu3cY7u6BnckpUi0dTB0HJ8a6P2qmJcws5a4ph+gtF58cT6zPIHENqwDsAVpczHr8aYM6D2dDnUMxwNg12/blZhGfDuW9qwj9g4J4saDlF6n6/yGWxL4ulAo7qS9TxmHVNOucJPT6B5X87n8DLYDJLD0cv5SHpIApDZDDkvVkQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729691603; c=relaxed/simple;
	bh=f0gGzmnuIaZms4baJfOT16Kn8TdIyl4HOd9QzbCFNoU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NxHmQmddZrLnqMo4xO93jQdPVkO9IxZVtaKRVAlxHwCOlQcKGhFDLgVWZgHzTZy9S9mhCOIV1HfMUl4U/tlbIKLkmkxE5d9YW5ZAHSFHnHiz4u45ANozLr6GKo3MmXsMH/ks77vB9UFg+bgpjbZ/wC3bx2ZWqCmqYOPniB45XuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CPGla9du; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CPGla9du"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A2BC742B33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1729691597; bh=hLYowu+Yu+XQFT9UuFcNrt/sUr3gogTUccwJDmEre2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CPGla9duVBmm9b6ehofp5ZvCEmYRi6BheC2jspDhPDuP2o8WowPf+2CbN6zxFbRC6
	 z1h7XYLquGMZK6UPY+MyHANeL1tGocvVRIFZzN9fMYCUp84kcPe+waB7ae/PFmW1ac
	 av0jnudHlyisDmFva1yg/iL45VG0fZl+KEbKsdSDyWqX2HuR2H0UFww2wCzv44XFLC
	 +ckOjMBLr13dMx+MXtLo9pNaJpG1FyGgonEukEbpqbP8R/u5vxVuKFiL3kdtKbvoxo
	 BhddjAb8U/yuB7Pk2ZEo+37NYvMEFyH1AUEfz/WYH7OF83O6l6Lrqwt7GDy5+dZNfn
	 Dew3PHxhlp1eg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A2BC742B33;
	Wed, 23 Oct 2024 13:53:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: anish kumar <yesanishhere@gmail.com>, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/1] remoteproc documentation changes
In-Reply-To: <20241023053357.5261-1-yesanishhere@gmail.com>
References: <20241023053357.5261-1-yesanishhere@gmail.com>
Date: Wed, 23 Oct 2024 07:53:16 -0600
Message-ID: <87a5evncxf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

anish kumar <yesanishhere@gmail.com> writes:

> This patch series transitions the documentation
> for remoteproc from the staging directory to the
> mainline kernel. It introduces both kernel and
> user-space APIs, enhancing the overall documentation
> quality.
>
> V4:
> Fixed compilation errors and moved documentation to
> driver-api directory.
>
> V3:
> Seperated out the patches further to make the intention
> clear for each patch.
>
> V2:
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-lkp@intel.com/

So I think you could make better use of kerneldoc comments for a number
of your APIs and structures - a project for the future.  I can't judge
the remoteproc aspects of this, but from a documentation mechanics point
of view, this looks about ready to me.  In the absence of objections
I'll apply it in the near future.

Thanks,

jon

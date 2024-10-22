Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A6015573B;
	Tue, 22 Oct 2024 21:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729633634; cv=none; b=K8fjTIz97R7tNPAvLmSB9+EujQNCmyoTJwp9y201a4mapQvL/m/BpFXztL/E2kKe6qWREt9lCjjE0apv9WBGWrJI/QKFi/bpe92xTOF+3Oi1s0aBqJVMSWAX6m7IpTpvElwllhL4I7vlfn9uLoViGjXkhUIX2doBfXPlm75zUgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729633634; c=relaxed/simple;
	bh=54lMYI81ZCLCzLazRDgv84RPFEXJ/NhUokeNeo2HYAE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TA1Xwm2QDoOWYJlLHt0wVMsfZFHencjgeFVA9mu2vglpL/t+oojTjcbDLNENC/SQAZPPpaC17srlCe6mOtzba1RonWff9IP5tF0K5Bf8EF0nxFTQvcCXn+fA+wB7PlU/DXl+u8K03nSE49lWjGmU6EPlAzZYMozkwAe2kE9Ik1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=n/wD3nat; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="n/wD3nat"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5F2B342C02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1729633622; bh=HZXHmiW1HxFL/xAxHiulNuglGOrc0zHRLUQBWbfPl8s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n/wD3nataBy95toyFKvAAoYsDyPnnyCI6KN+1KXEvNrNxIOsj/4b0W8E12iw6UIZ3
	 KfEJPXYvcKyp2ZmtSpV+67qpPC3xGOFHlczqjGV5dZqmApwz+V9I3DWVb6dR4L+Mky
	 nsIjUCufm0n2FD+53DMwwguEe3xFR9RySXRXMwkHIBsP2VxjFG/NsE6SYxVH3/NLRm
	 w8oGSCkQKyg1LoltsygVWW55spcx/qZ5kuMcQKltxgYDajEz0n7YRpHE5P3ebF5pGO
	 BQ8Dy1gpblgihw1TBgKFh8QxG0RL6fIxDIvm2NZXOg1YJus5ykB6wDO6e5j+qVnX3t
	 nJdAImGV2++dw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5F2B342C02;
	Tue, 22 Oct 2024 21:47:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: anish kumar <yesanishhere@gmail.com>, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, anish kumar <yesanishhere@gmail.com>
Subject: Re: [PATCH 3/7] Remoteproc: Documentation: add the main index
In-Reply-To: <20241022213516.1756-4-yesanishhere@gmail.com>
References: <20241022213516.1756-1-yesanishhere@gmail.com>
 <20241022213516.1756-4-yesanishhere@gmail.com>
Date: Tue, 22 Oct 2024 15:47:01 -0600
Message-ID: <87h693olnu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

anish kumar <yesanishhere@gmail.com> writes:

> Add index file so that readthedocs.io pick this file
> up and properly build the documentation site.
>
> Signed-off-by: anish kumar <yesanishhere@gmail.com>
> ---
>  Documentation/remoteproc/index.rst | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/remoteproc/index.rst

readthedocs.io is not particularly relevant here; this change is needed
simply to make the docs build work right.

Properly, you should have added a version of this file first, since your
series is not bisectable as organized.  For a docs change, that alone
does not merit redoing the series, though.  However...

You do need to remove the entry in Documentation/staging/index.rst, or
you will break the docs build.

Please be sure to do a proper docs build before sending a patch series
like this.

More to the point, though, why are you creating a new top-level
directory for this?  That's something I would really like to avoid.  It
looks like the existing document fits well in the driver-api manual, is
there a reason why you haven't put it there?

Thanks,

jon

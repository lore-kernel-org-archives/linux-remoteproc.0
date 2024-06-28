Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5E1BF37;
	Fri, 28 Jun 2024 03:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719544376; cv=none; b=E5BbhfkdgrnfAKi99t2YsCvMEuIfJVqt4IHEX9BARSymUE3dKAq++ra4oHLPV65MjKW1kmUhnpHv5FFpCz6IJxlkRIDGV8fuAQudZG+kjVaHfCl6jCczG2YCBpHSUQckbV3D91AUPLfzXhJqvgVv/5ZIsDlPv6nlmboCcNg5Ygk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719544376; c=relaxed/simple;
	bh=3nifBkuhyILV0xYL5KUSjJ3xZHJ6CLiSboXZwYqFvu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUdU7CwHQPXSRJ0KSerNN35jBiB68GdvPF3F6AC4BbLT2Od4DG+lFZsnXm0wxoqQfq1UUvz3bnXJJKXATzJ3bDUWzYyKynAqDVfGulr3PVpPtl/eFUiSgO69d1PjY2Re6tpoDVrHKnNR/NFlA7dKL7Jr1hJx4bQFpilOGy/osr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tomto9na; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tomto9na"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B868C116B1;
	Fri, 28 Jun 2024 03:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719544376;
	bh=3nifBkuhyILV0xYL5KUSjJ3xZHJ6CLiSboXZwYqFvu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tomto9naGoth49hJ1Rqkjib9MtgFAQm2S7pTq48tc6rqrauyDcKmnKlwpoPr/rngK
	 9xbddlb7mrhi5Qqy+ffwIryqSTByhVCfm02zT0UJ1QF9FTuegKKOCG+f4368GCcTA+
	 nhVA0h+3qZWJcqHsdFT1i8QVGF61Svws6Jzzq848yHBAWDkWzVMKNQcqxfZmJ164Z5
	 Kgv6HRaNY7fupHqT0u3eJEuehwpyiclDcw82J0dIu7FLpleEMj6OoVMYwpRGLjaz0p
	 w9JF5O5yCA/ORfJCdZWjauPvRDsGDMjpiqcu2qRZYwKj5svrGQ4vboyHk1naQEyEdV
	 PJnqTj5Yj+4xQ==
Date: Fri, 28 Jun 2024 11:12:50 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Don't attempt to remap l1tcm
 memory if missing
Message-ID: <Zn4qMmeuIqeszQOA@tzungbi-laptop>
References: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>

On Thu, Jun 27, 2024 at 05:20:55PM -0400, Nícolas F. R. A. Prado wrote:
> The current code doesn't check whether platform_get_resource_byname()
> succeeded to get the l1tcm memory, which is optional, before attempting
> to map it. This results in the following error message when it is
> missing:
> 
>   mtk-scp 10500000.scp: error -EINVAL: invalid resource (null)
> 
> Add a check so that the remapping is only attempted if the memory region
> exists. This also allows to simplify the logic handling failure to
> remap, since a failure then is always a failure.
> 
> Fixes: ca23ecfdbd44 ("remoteproc/mediatek: support L1TCM")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

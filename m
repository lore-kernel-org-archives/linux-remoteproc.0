Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471AD39DBCB;
	Thu, 30 Jul 2026 07:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396214; cv=none; b=UaJtWmmpmYCQwj5Pd6uO9js7+KsNkphqUqEcJfSYSZuptFQzIOvrIvU6XfYC3C7HnbkvKIaARbIVqnhXX+xfYXuOhQFIVlYmeLKTaCXvRaGpO0kyxqQiM+MR7U1D0UEIRqv3qeL/FKao0+0oFMxtEUvU/EOUwUeb5y341CrhPkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396214; c=relaxed/simple;
	bh=ui6LNEccLcic6JsDj59kBXxaGpZPEVN4OabyL3Uu/IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mp9T0qARdI70s8lqqhVuCMNtzEk02Pcjsi/10n9QhNd5cm/rC5rQ3DTUlqvwvgCmZvIEdQjAyUc07bweYRMiw1zR/q9ou8JXQx1kQO/+/GtKMRizSrvhm1V1s7eHL6SDVHB1D/3NmP2hR9+wOQuzKkm1pdsejy9YKDV3jRpmoFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anhmuc1R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anhmuc1R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C006B1F00A3A;
	Thu, 30 Jul 2026 07:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785396212;
	bh=zWfbnroXbU+DAUIBdFgGrJNP/ekemFI8iQT3ohNHtPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=anhmuc1RO5/HvCd4AJ37iT9vssw/NYzy3+k77mR5AmyjP6J231YVu9yaLqi2myuOH
	 6Fei5mwXHHgV74Zmml0+7VWRkiBYbI+kwgN7ZrmRziO1cFewUJtUMoxZRwazKu26h6
	 s52hBbASYe8yHK6sclpRQT+qaMJYjrzkX1Mix4j3opxPIsBZmE7V9LUPzKE3yomMBr
	 YedCv43uz0oLFk+gtYKHnUMT2WjmkQyy08flx2b3vRCxvvUI9pI06aB64oxUeQUPkl
	 Su1YUSOtu9xvxAtkbnEZgN8MAcBTi9GcxH3CySgebkXkCAswRepPtJ+513Q43LPduP
	 cQTdz1WwKa9Ng==
Date: Thu, 30 Jul 2026 09:23:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kumar Patro <bibek.patro@oss.qualcomm.com>, Komal Bajaj <komal.bajaj@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
Message-ID: <20260730-organic-chimpanzee-of-excellence-ebbcca@quoll>
References: <20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com>

On Wed, Jul 29, 2026 at 02:21:01PM +0530, Vishnu Santhosh wrote:
> The BAM-DMUX node lives as a direct child of the modem PAS remoteproc

No, it does not. Look:

  $  git describe
  next-20260729
  $ git grep bam-dmux
  No child node shown

Why isn't this part of Shikra remoteproc commit/patch? How any code
could pass validation otherwise?

> node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
> does not list bam-dmux, so any DT adding this subnode fails schema
> validation.

Fails how? How can I reproduce the error?

There is no bam-dma in this binding example.


Best regards,
Krzysztof


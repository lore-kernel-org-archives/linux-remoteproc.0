Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AEF308F3E;
	Wed, 24 Jun 2026 06:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282969; cv=none; b=uc6sZ4Hf2OHcAAn5r0D67DxF3PLwYCy9sXloEN7AdjmKY2nZcdJtHwShQGogiHf0LEzj3w3X5Sw/LSKRsZH3ugHpXx2bqEJ+OYkoH6IJIeoGnsNu354LvXgVaP1PdUP/z7tWB6mCgBpSYKVRks38DfnQMY1fl4vuOr/aSC7gehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282969; c=relaxed/simple;
	bh=KA9I2ZjyrN1CFvuZH67VbKbISrjyaUpF3onjKUlX5lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDld2uqiafkeV90cgmU553raBBjy1cd2D/pTtyhEuQme+T8wozKKxCobrx4ClvZ2I+J74OK1s7poAgnR9tyRZ6D5cQcUxyA1usMPxBL006X7MLO7/2FIH1HVTAYputqL+T6F73i94HbDfm6jX5AabZBS+j7xjQ98Wt1mLxAdLYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxGv/PYR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxGv/PYR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303571F000E9;
	Wed, 24 Jun 2026 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782282968;
	bh=cgKEs0AA8Uy9o90c5LjkWX5EJ2P+CUk7ArtnAkfUZ1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NxGv/PYR29kDXOv/yLyQrCJVkm46ekzRmnfBxWTBBbHYI06f1iVapPDph9k16MeNr
	 w5fAQz72PUUovKVBA0pESzemPduD3CsGmX/G/k6CwYKLOA61Fe4z5nnotJC3HS4aHX
	 /3c8vM64XSOnxG8o03JI6ZGVHdf/hUHTnsNbq99lt4wz+qTGdWSfBdCRggAWZnrn5l
	 2ki+WfKFy9hiQ7v4r8i3jLeW7gLUJwEnTnV3cU58kYozFSh1ogjxkI4oHoSqt0ahDP
	 r+oGcVeZ+Bz1v2oUfFic9am1i//hFBvhHAIQYAkESE3xhkH0XgXA9c3PDSgZICTlLv
	 QWUgQCcE8+4yg==
Date: Wed, 24 Jun 2026 08:36:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Hawi and Maili SoC
Message-ID: <20260624-impossible-pig-of-recreation-ecddea@quoll>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-4-1ec7bb5c9fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623-knp-soccp-v7-4-1ec7bb5c9fec@oss.qualcomm.com>

On Tue, Jun 23, 2026 at 03:05:20AM -0700, Jingyi Wang wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Document SoCCP remote processor used on Qualcomm Hawi and Maili SoC which
> is fully compatible with Kaanapali.
> 
> Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml        | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


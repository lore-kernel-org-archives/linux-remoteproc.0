Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253330;
	b=fjbvkSjzdPycWQOeXAKkdFJD8LCQ8uwDhRhWpuc5JiZeEALwi67C/3Tn6CrQyjJ0giMN
	 tgRZX58y2F0jyLJOX9VPaKs89TQKsHXQNVc4j3cagp1wFE/pFKKBOwzIoI6peOEpDbZHp
	 kDkBnPwn5YSQRRPRuxI4/KHXxMGrbTNeIL3EVQJiAVxMatl2oYzNC+s/939p5Xwn6++6d
	 UMrHtNPExq7qWrUL97nSJSv7yoinZvYdOLLVaU/ECxe8yS3iWUn04zdHOoEsySrN02org
	 KGwpmbNogwpCpD2gax+rdMu2AStunzlEKbMG444I37zAj3t6bQY7MI6QY77BteiWoVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253330;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7vaVE5R3JyV2mQ2BOautC269qRl1DkTsxMCsCqhSDMM=;
	b=xZJkG4apcgDPZ11RvQz6txs/sI54lMqUNnLszTUQz+gRELmMaGe/XsL/+iVshArvhmbI
	 vmQT9ZAfAVPuVwq3dbQbA6cU7/xxpFokN08SczNzH8kEbvijded137Myz6gy8n2gBB3BZ
	 fVQdUOK4xt0p3NaV/mC3oua5pnnK/Dl5EeEeV3xXLb4e+GyEwpVzmoyyGPY0sUzBmErGg
	 vd1vnE8EMLbrG7szgNw8QwCftm0jGVA3gw7HUqGYlGxmyTGGIWyX8lNxGdqMZfvqMhCBq
	 URowC0h22QSWxiqk37GvUdduZRPvALkeSFQ9pA9/64a7ayBflHixM86YAdbeDmn+Ypw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Hgre5y/t";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EEB606A320;
	Sat, 21 Nov 2026 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hgre5y/t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA211F000C0;
	Sat, 21 Nov 2026 09:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795253330;
	bh=7vaVE5R3JyV2mQ2BOautC269qRl1DkTsxMCsCqhSDMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hgre5y/tBeFd/P829wsbVTqlPJNw9yZ++APcuXFBaaXy2CwV7wu86EovOUNSUX6gc
	 w8eqZeUWzH6tUrjsiYBzOnJxdNgkZ3QkwPUJDji8Ot2jU5xhruPcS6fdbUChFRTgiL
	 4Nwn3US6gEXDvSi9jlH/PwH/5MhpdYTec9prMHGB+/10pCQxn4uvIyxtrPAPzHwBED
	 tjJk/TS4ukD9Opo4D96JUx8LV+3VN1DtNkoWpc3eczPhxhDZIdwNrs02NFj5WbDdqx
	 M2zlA6Ewf3O1L8uwbJVFrFwpXTwlCBx+A4xTGbndeX/Bd+swKc4V/uwA6xKzfUHqjS
	 FJDxYCWO+HjjA==
Date: Sat, 21 Nov 2026 10:28:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
Message-ID: <20261121-flawless-responsible-cheetah-0c3d87@quoll>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
 <20261121-red-chachalaca-of-essence-1ccb7c@quoll>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261121-red-chachalaca-of-essence-1ccb7c@quoll>

On Sat, Nov 21, 2026 at 10:25:55AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2026 at 06:50:50PM +0530, Komal Bajaj wrote:
> > The number of IOMMU streams used by a remote processor is not necessarily
> > limited to one. On Shikra, LPAICP uses three streams, while CDSP uses one
> > and MPSS does not use any. The existing single-entry limit therefore cannot
> > describe the LPAICP firmware streams.
> > 
> > Increase the maximum number of iommus entries to three and constrain it per
> > compatible: require three entries for qcom,shikra-lpaicp-pas, allow only
> > one for qcom,shikra-cdsp-pas, and disallow the property for
> > qcom,shikra-mpss-pas.
> > 
> > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > ---
> >  .../bindings/remoteproc/qcom,shikra-pas.yaml       | 24 +++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> > index 74f83b7ce08d..3b827f2aadb4 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> > @@ -92,7 +92,8 @@ properties:
> >      description:
> >        IOMMU specifiers of the streams used by the remote processor
> >        firmware for its memory accesses.
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 3
> 
> Review from v4 still applies, you need to list the items, either here
> (if devices share the list) or in if:then: part.

Although if the device does not differentiate them and this is not
flexible, then its fine.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


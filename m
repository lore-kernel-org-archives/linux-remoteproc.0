Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E883CB8FD;
	Tue,  4 Aug 2026 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859995; cv=none; b=n8BMpQmqOyPAkqoMAssLGLnS3N9zMFjI+krBRcWlEJRT2orFSvwAbFI1Dzc2lZv0Z22LSos46QOu6jiraQMMsxZDQXYroo4KxzUn9hJCfl/Q+AZ4KYnEsKPGl7N+X41T401C9Hy0JX1JuM2A+JW4PNv213IYAiS3jxGJwEmS1ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859995; c=relaxed/simple;
	bh=48fFIHGCJQ8vaoYld/bWPOYTS8f42xJqJdQ41UgUr90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5e0rMqBNp0cQqODJI1I8rjZ6JIE0fbaUQaFI3L9sUh1bxvi5jlhrudzJW5vKzMq/86YpsLjajr8gHxnZANkGoSPX/6my1zCP+rbVh9674LKdRbNLPcmPAFHPDDy0wqqtdDxTuOOURHIXPzNnvVRlDKsvhmlGyNodMM5ygSgV9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhjIZmOI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhjIZmOI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F1A1F000E9;
	Tue,  4 Aug 2026 16:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785859993;
	bh=Q8XFbAw9tjkrdq+omJyUywvqt0SRU2TAGM1PIXt1AuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mhjIZmOI3q9+hYIxdVjxNcTeZcy0UcPpQrmQf/K+5I9ejoNq1JKebSpkbr0iAGSL0
	 NXacmOU0ootgwTTE1yNz4zr/POkc7kCNCDlEhXRsV09PsSrkxSg8khTVZZkBue73iX
	 ScjnKZt+HgngTB+Nq+YdvTEuhROaGuDnPNIRKBKMs1wiUa+3NVA+gabvFMIRMEGK9c
	 pPBXa1ZAJpUXqeZDuH0fhili0DmzewKK2qzc/S19hdhnVZ1W2FSs3ZQaiMW8fgYCVk
	 2Siy8Wv7rR/S3MwJkHu51Jg8Yw6VTm/lJm32pgTaCJ0UIL533XdfdG18gsa3IrXHKK
	 XMNmTzaBXFPHw==
Date: Tue, 4 Aug 2026 11:13:10 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Make
 SDX75, Hawi and Maili MPSS fallback to SM8650
Message-ID: <anIPU5RKjWCya-5T@baldur>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
 <20260804-acoustic-military-coua-cb0caf@quoll>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-acoustic-military-coua-cb0caf@quoll>

On Tue, Aug 04, 2026 at 10:41:19AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 03, 2026 at 11:30:20PM +0530, Mukesh Ojha wrote:
> > SDX75, Hawi and Maili MPSS are compatible with the SM8650 MPSS as
> > they share the same set of interrupts, memory regions and power domains.
> > Rather than describing them as standalone compatibles, model them as
> > fallbacks to qcom,sm8650-mpss-pas.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 29 +++++++++----------
> >  1 file changed, 14 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > index a062188861ff..f722c55aadf4 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > @@ -18,9 +18,6 @@ properties:
> >      oneOf:
> >        - enum:
> >            - qcom,eliza-cdsp-pas
> > -          - qcom,hawi-mpss-pas
> 
> There is no known user of this.
> 
> Why do we even document this?
> 
> This is unfortunately one more example why I should accept early
> bindings without users.
> 

Thanks for catching this, Krzysztof. As written, this clearly should
have been accompanied by a driver patch.

Regards,
Bjorn

> Best regards,
> Krzysztof
> 

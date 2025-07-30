Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51B811CA0;
	Wed, 30 Jul 2025 03:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753846337; cv=pass; b=k3zcel3bavmIIArerJAV3slWCt4Zf4FrdShBSMIicLzn/7Dz/UoZC8UrL7Kdli4msmfBDs4mEqgYD/TZpiIPDu9DApAhlMG8Ui3gQtM++qpnv4cCA4+/bxhZmv8xFfCoCKi6OVwBpSuj5TTG0ZDAhhNFQIDSWuDRLB6iytXwHo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753846337; c=relaxed/simple;
	bh=v/mTQXR7nXI3YYXMNZ88NxH1RY7rcBGYIDdQy/5J6Zk=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=jH2id1ZZVZh0WLoatoPoO3kZAFlgK+QixNq9LpMSZkQvhjhHTpxTKv+0uSIzDyd6CMmEDce2lHNhc4J9ja7qdM+pYiv7I+KjaRU66svvgfAi4/YsosADce2J4HHBhLHD7lHIGfO5gOS6WNkEC2qZ5ZMsObBC53sGunYYvYdnHBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=anpXcqJ7; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="anpXcqJ7"
ARC-Seal: i=1; a=rsa-sha256; t=1753846298; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ezBzqJB56c1miHFXcMTWwIQnARYDgvONAST09HSTlXIdTc5Oyuwbece6Q6hbRu19qzxpXQyP+Ri8d4HmC8T0TzjsSVuuFn3W5IoKFG5ZJjTlXM+xKpqoSUyDs5RsKpx6ZpjVuzUAnh60Uk8dT2x+V46NU0ESTv9mRB3w00VvNPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753846298; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0iSJ3Kr1iquFsEaFYZYQunG3FhEI8rJM6UK4xjhKbMo=; 
	b=laocn2/YpsMzSuK4/HJD3XQbkTjgCDnYQbkYgdDSEqiQg5bs3ggxrpue5V0qtTl49tiJx8WX4odNOEAoB09qAn6D/FUbN8VTDB9PGHNP0JAKZTVCTbw0xWd8jzHpCeMEdxcgjp2FNSCuYbPT32zZ5dHv1GZctaG0IH17VOlKlsw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753846298;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0iSJ3Kr1iquFsEaFYZYQunG3FhEI8rJM6UK4xjhKbMo=;
	b=anpXcqJ7jz1fCyVmJQqEwO4uGzIAJAiI6kljdDFlpHkpMQxAdUXzHh1xk1MHCjz5
	u9ZSDGcNFQGowrt9ieLYx9YPwiRnEBYMyQAPjmv39JtD/kWZyYj3RveK762QmuPhRwX
	QSPODxowaRR76HgP8cBd648UVYPNL+d0Naz8k8H4=
Received: by mx.zohomail.com with SMTPS id 1753846295024259.9063222071202;
	Tue, 29 Jul 2025 20:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>
In-Reply-To: <f1b90b0f-f7a7-4117-9d36-046c4ca9c19a@kernel.org>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <1856e9e7bfdcb6a8.1f73e6be0161d31f.3ad0845628cf3b62@Jude-Air.local>
Date: Wed, 30 Jul 2025 03:31:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On 29/07/2025 08:27, Krzysztof Kozlowski wrote:
> On 28/07/2025 19:13, Junhui Liu wrote:
>>>
>>>> +    description:
>>>> +      This property is required only if the rpmsg/virtio functionality=
 is used.
>>>> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
>>>> +    items:
>>>> +      - description: mailbox channel to send data to C906L
>>>> +      - description: mailbox channel to receive data from C906L
>>>> +
>>>> +  memory-region:
>>>> +    description:
>>>> +      List of phandles to reserved memory regions used by the remote p=
rocessor.
>>>> +      The first region is required and provides the firmware region fo=
r the
>>>> +      remote processor. The following regions (vdev buffer, vrings) ar=
e optional
>>>> +      and are only required if rpmsg/virtio functionality is used.
>>>> +    minItems: 1
>>>
>>> Why isn't this constrained?
>>=20
>> Do you mean a maxItems should be added here?
>> >>
>>>> +    items:
>>>> +      - description: firmware region
>>>> +      - description: vdev buffer
>>>> +      - description: vring0
>>>> +      - description: vring1
>>>> +    additionalItems: true
>>>
>>> No, drop. This needs to be constrained.
>>=20
>> My intention is that RPMsg/OpenAMP is not the only use case for
>=20
> We don't allow such syntax, that's not negotiable. Why 322 redundant
> memory regions are fine now?
>=20
>> remoteproc. There are scenarios where the remoteproc is just used for
>> booting the remote processor without any communication with Linux. In
>> such case, only the firmware region is needed, and the other regions may
>> not be necessary.
>>=20
>> Additionally, the remote processor might reserve extra memory for custom
>> buffers or other firmware-specific purposes beyond virtio/rpmsg.
>> Therefore, I think only the firmware region should be required and
>> constrained, while allowing flexibility for additional/custom memory
>> regions as needed.
>=20
> So how does this work exactly without the rest? Remote processor boots
> and works fine? How do you communicate with it?
>=20
> Please describe exactly the usecase.

Thank you for your clarification.

The C906L remoteproc can run at two use cases:
1. Standalone mode: Only the firmware region is used. In this case, the
   remoteproc driver loads the firmware into the firmware region and
   boots the C906L. The C906L runs independently, without communication
   with Linux, and the mailbox is not used.
2. OpenAMP/RPMsg mode: The firmware region, vdev buffer, and vrings are
   used. In this scenario, the C906L runs firmware with OpenAMP support
   and communicates with Linux via the virtio memory regions and mailbox.

To summarize:
- Required: firmware region
- Optional: vdev buffer, vrings, mailbox

Then I can add a "maxItems: 4" to the memory-region property and remove
the "additionalItems: true" line.

Is this approach acceptable for you?

>=20
>=20
> Best regards,
> Krzysztof

--=20
Best regards,
Junhui Liu


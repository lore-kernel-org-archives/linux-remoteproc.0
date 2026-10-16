Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FE73DFC7B;
	Fri, 16 Oct 2026 13:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159056; cv=none; b=RraVhGJLx/RyDL6i8pV8fwkFlfrmljQM6Zm3vzrgadJDrR96CanXyrWim8MVziWatljGSCQe/8uptTPzB0WO8nPkvP9uf6nNipiseU8A/C/CMNwSUVkavM+TyGUBTlJ9pXT7W7w6WqN2BJHD//neHCHlQjVRvIpqLeXfvp7DIzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159056; c=relaxed/simple;
	bh=ETa1RDVtBiJ+rVRNbECOazML+umgUAf6OecbHc87jXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/a9Vz7wLjrpsER+H3YB8XDFF6IE94yCOV8AA/OzQLV4l9GZ9K+2v036v6SEPeZXPc9aE/QuNlyVb2opLwzJOmiTXQl3zBXCatS8QlPulixUa42G35SFen5FNlGVqZ02nFFiMEXE5pjGtpeBucWMfZBKzdiGVxzRNfpQ/Q2T8mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6TAxUxC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6TAxUxC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E5D1F000C4;
	Fri, 16 Oct 2026 13:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792159054;
	bh=bc5PopMUZG6tewygth6c6ikLmGZALIPiVeD4sThuW2Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=B6TAxUxCFtfqiUtHjkgAFQnS9/isrMyZPAL7Lt5C+MOfj4CpDRP/e9Vqy4E6vn3IL
	 cWa7yPz+5SUKhTVt7+Cqr0Y5Sj/vhdrh5PKdFz+Byq8QDfdhZLIorRiFYqW5YgqvKe
	 JfjJUmWdYZvXSeIgYjBKeusMRRZWiWEB6R6yhVqh6J43ibmQZ+qteVl3e97ArsDZFJ
	 e5TCPfNZkvF473ALRavuuJDupoP6Zx/vXijK6qHHlGsx+5AQQVrFFRnDjFeJke/NoH
	 PIreMB7h9VpHuvK1KY+f3YwuUTQGCpFpusLoqN3vRsRScqz2OVP3uGuljh2kNruQ67
	 o9wTy12nin0tw==
Message-ID: <4e7eb12e-f932-4262-a3c9-2c6620b9354d@kernel.org>
Date: Fri, 16 Oct 2026 15:57:29 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
To: Ben Levinsky <blevinsk@amd.com>
Cc: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Shah, Tanmay" <tanmay.shah@amd.com>, "Levinsky, Ben" <ben.levinsky@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-4-ben.levinsky@amd.com>
 <20261015-humble-eager-mushroom-9db4aa@quoll>
 <DM4PR12MB644859F1CA3A936684A3338B839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
 <7067e343-24b9-4e3e-8e5e-42c98239ccae@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <7067e343-24b9-4e3e-8e5e-42c98239ccae@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/10/2026 16:29, Ben Levinsky wrote:
> 
>>
>>
>> *From: *Krzysztof Kozlowski <krzk@kernel.org>
>> *Date: *Thursday, October 15, 2026 at 2:46 AM
>> *To: *Levinsky, Ben <ben.levinsky@amd.com>
>> *Cc: *jassisinghbrar@gmail.com <jassisinghbrar@gmail.com>; andersson@kernel.org 
>> <andersson@kernel.org>; mathieu.poirier@linaro.org <mathieu.poirier@linaro.org>; 
>> robh@kernel.org <robh@kernel.org>; krzk+dt@kernel.org <krzk+dt@kernel.org>; 
>> conor+dt@kernel.org <conor+dt@kernel.org>; Simek, Michal <michal.simek@amd.com>; 
>> linux-remoteproc@vger.kernel.org <linux-remoteproc@vger.kernel.org>; 
>> devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arm- 
>> kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux- 
>> kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; Shah, Tanmay 
>> <tanmay.shah@amd.com>
>> *Subject: *Re: [PATCH 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
>>
>> On Wed, Oct 14, 2026 at 02:34:23PM -0700, Ben Levinsky wrote:
>>  > Document the AMD programmable-logic Mailbox IP used for bidirectional
>>  > FIFO communication between two processor-facing interfaces.
>>  >
>>  > The same IP is used on ZynqMP, Versal, Versal NET and Versal Gen 2.
>>  > Name each SoC in its compatible, and use amd,zynqmp-pl-mbox-2.1 as the
>>  > fallback that drivers match.
>>  >
>>  > Define the transmit and receive channel indices together with the register
>>  > aperture, interrupt, and interface clock. Describe the FIFO depth chosen
>>  > when the IP is configured, so that the driver can size received messages
>>  > to it.
>>  >
>>  > Assisted-by: LLM sparse
>>
>> How sparse assists here? It's something new. Since when does it parse
>> yaml code?
> 
>   Hi Krzysztof,
> 
>   Thank you for the review.
> 
>   You are right, sparse was not used for this patch. It was only run on
>   the C patches of the series, and I applied the same trailer to the
>   whole series by mistake. In v2 the binding patches will name only the
>   model, and the tool list will match what was actually used on each
>   patch.
> 
>>
>>  > Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>>  > ---
>>  >  .../mailbox/amd,zynqmp-pl-mbox-2.1.yaml       | 74 +++++++++++++++++++
>>  >  1 file changed, 74 insertions(+)
>>  >  create mode 100644 Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl- 
>> mbox-2.1.yaml
>>  >
>>  > diff --git a/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl- 
>> mbox-2.1.yaml b/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl- 
>> mbox-2.1.yaml
>>  > new file mode 100644
>>  > index 000000000000..2cc0d106b888
>>  > --- /dev/null
>>  > +++ b/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
>>  > @@ -0,0 +1,74 @@
>>  > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>  > +%YAML 1.2
>>  > +---
>>  > +$id: http://devicetree.org/schemas/mailbox/amd,zynqmp-pl-mbox-2.1.yaml# 
>> <http://devicetree.org/schemas/mailbox/amd,zynqmp-pl-mbox-2.1.yaml#>
>>  > +$schema: http://devicetree.org/meta-schemas/core.yaml# <http:// 
>> devicetree.org/meta-schemas/core.yaml#>
>>  > +
>>  > +title: AMD Programmable Logic Mailbox IP
>>  > +
>>  > +maintainers:
>>  > +  - Ben Levinsky <ben.levinsky@amd.com>
>>  > +
>>  > +description: |
>>  > +  The AMD Programmable Logic Mailbox IP provides bidirectional message passing
>>  > +  between two processor-facing interfaces. Each interface writes messages to
>>  > +  a send FIFO and reads messages from a receive FIFO. The register aperture,
>>  > +  interrupt, and clock described by a node belong to one processor-facing
>>  > +  interface. Channel 0 represents transmit and channel 1 represents receive
>>  > +  for that interface.
>>  > +
>>  > +properties:
>>  > +  compatible:
>>  > +    oneOf:
>>  > +      - const: amd,zynqmp-pl-mbox-2.1
>>
>> What is 2.1? Your SoC has different versions?
> 
>   2.1 is the version of the Mailbox IP core in the Xilinx IP catalog
>   (Mailbox v2.1). It is not a SoC version. The IP is synthesized into the
>   programmable logic, so the same core is used on every SoC, and the SoC
>   names in the compatibles do not add information.

Heh? This is in contrast to writing bindings.

> 
>   In v2 I will use a single IP-versioned compatible, "xlnx,mailbox-2.1",
>   and drop the SoC-specific ones. This is also the compatible the Xilinx
>   device tree generator already emits for this IP.

No, use SoC naming. Just like every other vendor. Remember: before doing
something completely different, first find arguments why your
vendor/patchset should be special.


Best regards,
Krzysztof

Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF932C4332F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Apr 2022 06:54:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350844AbiDLG4z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Apr 2022 02:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351486AbiDLGxn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Apr 2022 02:53:43 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C161834B;
        Mon, 11 Apr 2022 23:41:22 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23C6fB6d126223;
        Tue, 12 Apr 2022 01:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1649745671;
        bh=ryFspbi7U5eOpPSWkofesym52c9XFNMHay0/UVI/cCA=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=e0T7Sd2XbL7Jlur/ULNsmnXo1drOOWWKiPEp8LzOLxLrTUpvBUXpeUJ1MyQaow1SG
         N7VG77gkGDvyxo4tPRvB4G0sfDzUzxHFaN1v1KnF3sEJOOKooNj+yV5bBwf2Psp+U4
         niiRQTx61IJyLp1IeJPDgjp5kHemcsS2hveXbtis=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23C6fBtU097102
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Apr 2022 01:41:11 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Apr 2022 01:41:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Apr 2022 01:41:10 -0500
Received: from [172.24.222.151] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23C6f2wV057949;
        Tue, 12 Apr 2022 01:41:03 -0500
Message-ID: <b1f3a81b-8384-981b-5207-01deaa6037c5@ti.com>
Date:   Tue, 12 Apr 2022 12:11:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC 01/13] dt-bindings: remoteproc: Add PRU consumer bindings
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>, <s-anna@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <davem@davemloft.net>,
        <kuba@kernel.org>, <netdev@vger.kernel.org>, <vigneshr@ti.com>,
        <kishon@ti.com>
References: <20220406094358.7895-1-p-mohan@ti.com>
 <20220406094358.7895-2-p-mohan@ti.com> <Yk7+wXwDHrtjFo9s@robh.at.kernel.org>
From:   Puranjay Mohan <p-mohan@ti.com>
In-Reply-To: <Yk7+wXwDHrtjFo9s@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rob,

On 07/04/22 20:39, Rob Herring wrote:
> On Wed, Apr 06, 2022 at 03:13:46PM +0530, Puranjay Mohan wrote:
>> From: Suman Anna <s-anna@ti.com>
>>
>> Add a YAML binding document for PRU consumers. The binding includes
>> all the common properties that can be used by different PRU consumer
>> or application nodes and supported by the PRU remoteproc driver.
>> These are used to configure the PRU hardware for specific user
>> applications.
>>
>> The application nodes themselves should define their own bindings.
>>
>> Co-developed-by: Tero Kristo <t-kristo@ti.com>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>> Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
>> ---
>>  .../bindings/remoteproc/ti,pru-consumer.yaml  | 66 +++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
>> new file mode 100644
>> index 000000000000..c245fe1de656
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/ti,pru-consumer.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Common TI PRU Consumer Binding
>> +
>> +maintainers:
>> +  - Suman Anna <s-anna@ti.com>
>> +
>> +description: |
>> +  A PRU application/consumer/user node typically uses one or more PRU device
>> +  nodes to implement a PRU application/functionality. Each application/client
>> +  node would need a reference to at least a PRU node, and optionally define
>> +  some properties needed for hardware/firmware configuration. The below
>> +  properties are a list of common properties supported by the PRU remoteproc
>> +  infrastructure.
>> +
>> +  The application nodes shall define their own bindings like regular platform
>> +  devices, so below are in addition to each node's bindings.
>> +
>> +properties:
>> +  ti,prus:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Needs contraints. A phandle-array is really a matrix of phandles and 
> args. If no args, something like this:
> 
> minItems: ??
> maxItems: ??
> items:
>   maxItems: 1

So, I can add:
minItems: 1
as max items can't be constrained.
Also, there are no args.

> 
>> +    description: phandles to the PRU, RTU or Tx_PRU nodes used
>> +
>> +  firmware-name:
>> +    $ref: /schemas/types.yaml#/definitions/string-array
>> +    description: |
>> +      firmwares for the PRU cores, the default firmware for the core from
>> +      the PRU node will be used if not provided. The firmware names should
>> +      correspond to the PRU cores listed in the 'ti,prus' property
>> +
>> +  ti,pruss-gp-mux-sel:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    maxItems: 6
>> +    items:
>> +        enum: [0, 1, 2, 3, 4]
>> +    description: |
>> +      array of values for the GP_MUX_SEL under PRUSS_GPCFG register for a PRU.
>> +      This selects the internal muxing scheme for the PRU instance. Values
>> +      should correspond to the PRU cores listed in the 'ti,prus' property. The
>> +      GP_MUX_SEL setting is a per-slice setting (one setting for PRU0, RTU0,
>> +      and Tx_PRU0 on K3 SoCs). Use the same value for all cores within the
>> +      same slice in the associative array. If the array size is smaller than
>> +      the size of 'ti,prus' property, the default out-of-reset value (0) for the
>> +      PRU core is used.
>> +
>> +required:
>> +  - ti,prus
>> +
>> +dependencies:
>> +  firmware-name: [ 'ti,prus' ]
>> +  ti,pruss-gp-mux-sel: [ 'ti,prus' ]
>> +
>> +additionalProperties: true
> 
> This must be false unless it is a common, shared schema.

This is a shared schema, so I made it true.

> 
>> +
>> +examples:
>> +  - |
>> +    /* PRU application node example */
>> +    pru-app {
>> +        ti,prus = <&pru0>, <&pru1>;
>> +        firmware-name = "pruss-app-fw0", "pruss-app-fw1";
>> +        ti,pruss-gp-mux-sel = <2>, <1>;
>> +    };
>> -- 
>> 2.17.1
>>
>>


Thanks,
Puranjay

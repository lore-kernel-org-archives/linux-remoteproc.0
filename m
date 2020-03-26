Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 3/7] dt-bindings: remoteproc: Add bindings for R5F
 subsystem on TI K3 SoCs
References: <20200324201819.23095-1-s-anna@ti.com>
 <20200324201819.23095-4-s-anna@ti.com> <20200326162802.GA32328@bogus>
From: Suman Anna <s-anna@ti.com>
Message-ID: <90bae05e-dd47-5b71-07a7-5c3efd929143@ti.com>
Date: Thu, 26 Mar 2020 13:09:40 -0500
MIME-Version: 1.0
In-Reply-To: <20200326162802.GA32328@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Rob,

On 3/26/20 11:28 AM, Rob Herring wrote:
> On Tue, 24 Mar 2020 15:18:15 -0500, Suman Anna wrote:
>> The Texas Instruments K3 family of SoCs have one or more dual-core
>> Arm Cortex R5F processor subsystems/clusters (R5FSS). The clusters
>> can be split between multiple voltage domains as well. Add the device
>> tree bindings document for these R5F subsystem devices. These R5F
>> processors do not have an MMU, and so require fixed memory carveout
>> regions matching the firmware image addresses. The nodes require more
>> than one memory region, with the first memory region used for DMA
>> allocations at runtime. The remaining memory regions are reserved
>> and are used for the loading and running of the R5F remote processors.
>> The R5F processors can also optionally use any internal on-chip SRAM
>> memories either for executing code or using it as fast-access data.
>>
>> The added example illustrates the DT nodes for the single R5FSS device
>> present on K3 AM65x family of SoCs.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>> Hi Rob,
>>
>> The dt_bindings_check seems to throw couple of warnings around the
>> usage of ranges because the tooling is adding the #address-cells
>> and #size-cells of 1 by default, whereas our actual code uses 2.
>> No issues are found with dtbs_check.
>>
>> regards
>> Suman
>>
>>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 338 ++++++++++++++++++
>>  1 file changed, 338 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dts:23.13-20: Warning (ranges_format): /example-0/reserved-memory:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
> Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dts:23.13-20: Warning (ranges_format): /example-0/reserved-memory:ranges: empty "ranges" property but its #size-cells (2) differs from /example-0 (1)
> Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dts:54.13-56.72: Warning (ranges_format): /example-0/interconnect@100000:ranges: "ranges" property has invalid length (72 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 2)

I only saw these, because the generated example dts is using cell values
of 1. I tried adding them using 2 in my example, but then it complains
about duplicate properties. I do not know how to fix these though. Same
with the K3 DSP bindings patches as well.

> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dt.yaml: interconnect@100000: $nodename:0: 'interconnect@100000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dt.yaml: interconnect@28380000: $nodename:0: 'interconnect@28380000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dt.yaml: mcu-ram@41c00000: 'r5f-sram@0' does not match any of the regexes: '^([a-z]*-)?sram(-section)?@[a-f0-9]+$', 'pinctrl-[0-9]+'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dt.yaml: mcu-ram@41c00000: $nodename:0: 'mcu-ram@41c00000' does not match '^sram(@.*)?'

These node names are already upstream. Do I just update the example or
the upstream dts also needs fixing?

> 
> See https://patchwork.ozlabs.org/patch/1260966
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Thanks, will upgrade my dt-schema.

regards
Suman

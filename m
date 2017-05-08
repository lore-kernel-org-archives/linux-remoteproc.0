Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 8 May 2017 12:06:06 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 4/5] soc: qcom: Add device tree binding for GLINK RPM
Message-ID: <20170508170606.uchxrihfodk6yts5@rob-hp-laptop>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
 <20170504200539.27027-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170504200539.27027-4-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, May 04, 2017 at 01:05:38PM -0700, Bjorn Andersson wrote:
> Add device tree binding documentation for the Qualcomm GLINK RPM, used
> for communication with the Resource Power Management subsystem in
> various Qualcomm SoCs.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v3:
> - Transition doorbell to mailbox framework
> 
> Changes since v2:
> - Replace qcom,ipc syscon with a "doorbell"
> 
> Changes since v1:
> - None
> 
>  .../devicetree/bindings/soc/qcom/qcom,glink.txt    | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> new file mode 100644
> index 000000000000..e32198df0e9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> @@ -0,0 +1,73 @@
> +Qualcomm RPM GLINK binding
> +
> +This binding describes the Qualcomm RPM GLINK, a fifo based mechanism for
> +communication with the Resource Power Management system on various Qualcomm
> +platforms.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "qcom,glink-rpm"
> +
> +- interrupts:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: should specify the IRQ used by the remote processor to
> +		    signal this processor about communication related events
> +
> +- qcom,rpm-msg-ram:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: handle to RPM message memory resource
> +
> +- mboxes:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: reference to the "rpm_hlos" mailbox in APCS, as described
> +		    in mailbox/mailbox.txt
> +
> += GLINK DEVICES
> +Each subnode of the GLINK node represent function tied to a virtual
> +communication channel. The name of the nodes are not important. The properties
> +of these nodes are defined by the individual bindings for the specific function
> +- but must contain the following property:
> +
> +- qcom,glink-channels:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: a list of channels tied to this function, used for matching
> +		    the function to a set of virtual channels
> +
> += EXAMPLE
> +The following example represents the GLINK RPM node on a MSM8996 device, with
> +the function for the "rpm_request" channel defined, which is used for
> +regualtors and root clocks.
> +
> +	apcs_glb: apcs-glb@9820000 {

mailbox@... Or does this block do other things?

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>


> +		compatible = "qcom,msm8996-apcs-hmss-global";
> +		reg = <0x9820000 0x1000>;
> +
> +		#mbox-cells = <1>;
> +	};
> +
> +	rpm_msg_ram: memory@68000 {
> +		compatible = "qcom,rpm-msg-ram";
> +		reg = <0x68000 0x6000>;
> +	};
> +
> +	rpm-glink {
> +		compatible = "qcom,glink-rpm";
> +
> +		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +
> +		qcom,rpm-msg-ram = <&rpm_msg_ram>;
> +
> +		mboxes = <&apcs_glb 0>;
> +
> +		rpm-requests {
> +			compatible = "qcom,rpm-msm8996";
> +			qcom,glink-channels = "rpm_requests";
> +
> +			...
> +		};
> +	};
> -- 
> 2.12.0
> 

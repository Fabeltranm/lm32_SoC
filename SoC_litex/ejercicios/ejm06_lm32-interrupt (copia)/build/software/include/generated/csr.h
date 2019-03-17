#ifndef __GENERATED_CSR_H
#define __GENERATED_CSR_H
#include <stdint.h>
#ifdef CSR_ACCESSORS_DEFINED
extern void csr_writeb(uint8_t value, uint32_t addr);
extern uint8_t csr_readb(uint32_t addr);
extern void csr_writew(uint16_t value, uint32_t addr);
extern uint16_t csr_readw(uint32_t addr);
extern void csr_writel(uint32_t value, uint32_t addr);
extern uint32_t csr_readl(uint32_t addr);
#else /* ! CSR_ACCESSORS_DEFINED */
#include <hw/common.h>
#endif /* ! CSR_ACCESSORS_DEFINED */

/* button */
#define CSR_BUTTON_BASE 0xe0004000
#define CSR_BUTTON_IN_ADDR 0xe0004000
#define CSR_BUTTON_IN_SIZE 1
static inline unsigned int button_in_read(void) {
	unsigned int r = csr_readl(0xe0004000);
	return r;
}

/* ctrl */
#define CSR_CTRL_BASE 0xe0000000
#define CSR_CTRL_RESET_ADDR 0xe0000000
#define CSR_CTRL_RESET_SIZE 1
static inline unsigned int ctrl_reset_read(void) {
	unsigned int r = csr_readl(0xe0000000);
	return r;
}
static inline void ctrl_reset_write(unsigned int value) {
	csr_writel(value, 0xe0000000);
}
#define CSR_CTRL_SCRATCH_ADDR 0xe0000004
#define CSR_CTRL_SCRATCH_SIZE 1
static inline unsigned int ctrl_scratch_read(void) {
	unsigned int r = csr_readl(0xe0000004);
	return r;
}
static inline void ctrl_scratch_write(unsigned int value) {
	csr_writel(value, 0xe0000004);
}
#define CSR_CTRL_BUS_ERRORS_ADDR 0xe0000008
#define CSR_CTRL_BUS_ERRORS_SIZE 1
static inline unsigned int ctrl_bus_errors_read(void) {
	unsigned int r = csr_readl(0xe0000008);
	return r;
}

/* led */
#define CSR_LED_BASE 0xe0004800
#define CSR_LED_OUT_ADDR 0xe0004800
#define CSR_LED_OUT_SIZE 1
static inline unsigned int led_out_read(void) {
	unsigned int r = csr_readl(0xe0004800);
	return r;
}
static inline void led_out_write(unsigned int value) {
	csr_writel(value, 0xe0004800);
}

/* timer0 */
#define CSR_TIMER0_BASE 0xe0002800
#define CSR_TIMER0_LOAD_ADDR 0xe0002800
#define CSR_TIMER0_LOAD_SIZE 1
static inline unsigned int timer0_load_read(void) {
	unsigned int r = csr_readl(0xe0002800);
	return r;
}
static inline void timer0_load_write(unsigned int value) {
	csr_writel(value, 0xe0002800);
}
#define CSR_TIMER0_RELOAD_ADDR 0xe0002804
#define CSR_TIMER0_RELOAD_SIZE 1
static inline unsigned int timer0_reload_read(void) {
	unsigned int r = csr_readl(0xe0002804);
	return r;
}
static inline void timer0_reload_write(unsigned int value) {
	csr_writel(value, 0xe0002804);
}
#define CSR_TIMER0_EN_ADDR 0xe0002808
#define CSR_TIMER0_EN_SIZE 1
static inline unsigned int timer0_en_read(void) {
	unsigned int r = csr_readl(0xe0002808);
	return r;
}
static inline void timer0_en_write(unsigned int value) {
	csr_writel(value, 0xe0002808);
}
#define CSR_TIMER0_UPDATE_VALUE_ADDR 0xe000280c
#define CSR_TIMER0_UPDATE_VALUE_SIZE 1
static inline unsigned int timer0_update_value_read(void) {
	unsigned int r = csr_readl(0xe000280c);
	return r;
}
static inline void timer0_update_value_write(unsigned int value) {
	csr_writel(value, 0xe000280c);
}
#define CSR_TIMER0_VALUE_ADDR 0xe0002810
#define CSR_TIMER0_VALUE_SIZE 1
static inline unsigned int timer0_value_read(void) {
	unsigned int r = csr_readl(0xe0002810);
	return r;
}
#define CSR_TIMER0_EV_STATUS_ADDR 0xe0002814
#define CSR_TIMER0_EV_STATUS_SIZE 1
static inline unsigned int timer0_ev_status_read(void) {
	unsigned int r = csr_readl(0xe0002814);
	return r;
}
static inline void timer0_ev_status_write(unsigned int value) {
	csr_writel(value, 0xe0002814);
}
#define CSR_TIMER0_EV_PENDING_ADDR 0xe0002818
#define CSR_TIMER0_EV_PENDING_SIZE 1
static inline unsigned int timer0_ev_pending_read(void) {
	unsigned int r = csr_readl(0xe0002818);
	return r;
}
static inline void timer0_ev_pending_write(unsigned int value) {
	csr_writel(value, 0xe0002818);
}
#define CSR_TIMER0_EV_ENABLE_ADDR 0xe000281c
#define CSR_TIMER0_EV_ENABLE_SIZE 1
static inline unsigned int timer0_ev_enable_read(void) {
	unsigned int r = csr_readl(0xe000281c);
	return r;
}
static inline void timer0_ev_enable_write(unsigned int value) {
	csr_writel(value, 0xe000281c);
}

/* uart */
#define CSR_UART_BASE 0xe0001800
#define CSR_UART_RXTX_ADDR 0xe0001800
#define CSR_UART_RXTX_SIZE 1
static inline unsigned int uart_rxtx_read(void) {
	unsigned int r = csr_readl(0xe0001800);
	return r;
}
static inline void uart_rxtx_write(unsigned int value) {
	csr_writel(value, 0xe0001800);
}
#define CSR_UART_TXFULL_ADDR 0xe0001804
#define CSR_UART_TXFULL_SIZE 1
static inline unsigned int uart_txfull_read(void) {
	unsigned int r = csr_readl(0xe0001804);
	return r;
}
#define CSR_UART_RXEMPTY_ADDR 0xe0001808
#define CSR_UART_RXEMPTY_SIZE 1
static inline unsigned int uart_rxempty_read(void) {
	unsigned int r = csr_readl(0xe0001808);
	return r;
}
#define CSR_UART_EV_STATUS_ADDR 0xe000180c
#define CSR_UART_EV_STATUS_SIZE 1
static inline unsigned int uart_ev_status_read(void) {
	unsigned int r = csr_readl(0xe000180c);
	return r;
}
static inline void uart_ev_status_write(unsigned int value) {
	csr_writel(value, 0xe000180c);
}
#define CSR_UART_EV_PENDING_ADDR 0xe0001810
#define CSR_UART_EV_PENDING_SIZE 1
static inline unsigned int uart_ev_pending_read(void) {
	unsigned int r = csr_readl(0xe0001810);
	return r;
}
static inline void uart_ev_pending_write(unsigned int value) {
	csr_writel(value, 0xe0001810);
}
#define CSR_UART_EV_ENABLE_ADDR 0xe0001814
#define CSR_UART_EV_ENABLE_SIZE 1
static inline unsigned int uart_ev_enable_read(void) {
	unsigned int r = csr_readl(0xe0001814);
	return r;
}
static inline void uart_ev_enable_write(unsigned int value) {
	csr_writel(value, 0xe0001814);
}

/* uart_phy */
#define CSR_UART_PHY_BASE 0xe0001000
#define CSR_UART_PHY_TUNING_WORD_ADDR 0xe0001000
#define CSR_UART_PHY_TUNING_WORD_SIZE 1
static inline unsigned int uart_phy_tuning_word_read(void) {
	unsigned int r = csr_readl(0xe0001000);
	return r;
}
static inline void uart_phy_tuning_word_write(unsigned int value) {
	csr_writel(value, 0xe0001000);
}

/* identifier_mem */
#define CSR_IDENTIFIER_MEM_BASE 0xe0002000

/* constants */
#define NMI_INTERRUPT 0
static inline int nmi_interrupt_read(void) {
	return 0;
}
#define TIMER0_INTERRUPT 1
static inline int timer0_interrupt_read(void) {
	return 1;
}
#define UART_INTERRUPT 2
static inline int uart_interrupt_read(void) {
	return 2;
}
#define CSR_DATA_WIDTH 32
static inline int csr_data_width_read(void) {
	return 32;
}
#define SYSTEM_CLOCK_FREQUENCY 32000000
static inline int system_clock_frequency_read(void) {
	return 32000000;
}
#define CONFIG_CLOCK_FREQUENCY 32000000
static inline int config_clock_frequency_read(void) {
	return 32000000;
}
#define CONFIG_CPU_RESET_ADDR 0
static inline int config_cpu_reset_addr_read(void) {
	return 0;
}
#define CONFIG_CPU_TYPE "LM32"
static inline const char * config_cpu_type_read(void) {
	return "LM32";
}
#define CONFIG_CSR_DATA_WIDTH 32
static inline int config_csr_data_width_read(void) {
	return 32;
}

#endif
